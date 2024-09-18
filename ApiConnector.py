from fastapi import FastAPI
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import re
import numpy as np
import pickle
import joblib
from typing import List
import uvicorn
from fastapi.middleware.cors import CORSMiddleware
from nltk.stem import WordNetLemmatizer
import nltk
from tensorflow.keras.models import load_model
from asyncio import Event
import json


app = FastAPI()

predicted_class = "null"
confidence = 0.0
update_event = Event()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this to your frontend's URL in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class InputText(BaseModel):
    text: str



@app.post("/predict")
async def predict_genre(input_text: InputText):

    print(input_text)
    genre_type = []
    
    # Load models and data
    mainGenres = np.load("mainGenres.npy", allow_pickle=True)
    with open("model.pkl", "rb") as pkl_file:
        models = pickle.load(pkl_file)
    tfidf = joblib.load("tfidf.joblib")
    
    # Transform input text using TF-IDF
    input_vector = tfidf.transform([input_text.text])
    
    # Predict genre for the given sentence
    for genre in mainGenres:
        prediction = models[genre].predict(input_vector)
        if prediction == 1:
            genre_type.append(genre)
    
    response_data = {"Genre_Type": genre_type}
    print(response_data)
    return response_data


############### ChatBot Model #################{
ChatModel = load_model('D:/Utem folder/SEM 5/BITI3413 NPL/Project/NLP_ChatBot/ChatBot/chatbot_model.h5')
intents = json.loads(open('D:/Utem folder/SEM 5/BITI3413 NPL/Project/NLP_ChatBot/ChatBot/intents.json').read())
words = pickle.load(open('D:/Utem folder/SEM 5/BITI3413 NPL/Project/NLP_ChatBot/ChatBot/words.pkl', 'rb'))
classes = pickle.load(open('D:/Utem folder/SEM 5/BITI3413 NPL/Project/NLP_ChatBot/ChatBot/classes.pkl', 'rb'))

lemmatizer = WordNetLemmatizer()

def clean_up_sentence(sentence):
    sentence_words = nltk.word_tokenize(sentence)
    sentence_words = [lemmatizer.lemmatize(word.lower()) for word in sentence_words]
    return sentence_words

def bow(sentence, words, show_details=True):
    sentence_words = clean_up_sentence(sentence)
    bag = [0] * len(words)
    for s in sentence_words:
        for i, w in enumerate(words):
            if w == s:
                bag[i] = 1
                if show_details:
                    print("found in bag: %s" % w)
    return np.array(bag)

def predict_class(sentence, ChatModel):
    p = bow(sentence, words, show_details=False)
    res = ChatModel.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = [{"intent": classes[r[0]], "probability": str(r[1])} for r in results]
    return return_list

def getResponse(ints, intents_json):
    if ints:
        tag = ints[0]['intent']
        list_of_intents = intents_json['intents']
        for i in list_of_intents:
            if i['tag'] == tag:
                result = np.random.choice(i['responses'])
                break
        return result
    else:
        return "I'm not sure what you're asking for. Can you be more specific?"

############### ChatBot Model #################}

@app.post("/chat")
async def chatBot_NLP_Model(text: str):
    ints = predict_class(text, ChatModel)
    res = getResponse(ints, intents)
    return {"response": res}


if __name__ == "__main__":

    host = "192.168.1.11"
    port = 8080

    uvicorn.run(app, host=host, port=port)
