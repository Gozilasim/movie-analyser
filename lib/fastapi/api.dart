import 'dart:convert';
import 'package:http/http.dart' as http;
import '../apiKey.dart';




Future<List<String>> sendTextToServer(String text) async {
  final apiUrl = 'http://$FastapiKey/predict';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'text': text}),
  );

  if (response.statusCode == 200) {
    // Handle the successful response
    final Map<String, dynamic> data = json.decode(response.body);
;
    List<String> genreTypes = List.from(data['Genre_Type']);
    print(genreTypes);
    return genreTypes;
  } else {
    // Handle errors
    print("Error: ${response.reasonPhrase}");
    throw Exception("Failed to fetch data 2");
  }
}


