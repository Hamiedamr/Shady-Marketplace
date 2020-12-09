import 'dart:convert';

import "package:http/http.dart" as http;

class Album {
  final userName;
  final password;

  Album({this.userName, this.password});

}

Future<dynamic> createAlbum(String userName, String password) async {
  final http.Response response = await http.post(
    'http://192.168.1.10:5000/signin',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'userName': userName, 'password': password}),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
