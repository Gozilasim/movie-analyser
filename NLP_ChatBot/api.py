from tensorflow.keras.models import load_model
from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from asyncio import Event
import uvicorn
import numpy as np
from io import BytesIO
from PIL import Image
import tensorflow as tf
import nltk
import json
import pickle



from nltk.stem import WordNetLemmatizer

#file import
#from ChatBot import chatBot


app = FastAPI()

predicted_class = "null"
confidence = 0.0
update_event = Event()

origins = [
    "http://localhost",
    "http://localhost:3000",
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

############### ChatBot Model #################{
ChatModel = load_model('ChatBot/chatbot_model.h5')
intents = json.loads(open('ChatBot/intents.json').read())
words = pickle.load(open('ChatBot/words.pkl', 'rb'))
classes = pickle.load(open('ChatBot/classes.pkl', 'rb'))

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
   uvicorn.run(app, host='192.168.1.16', port=8001)
    


