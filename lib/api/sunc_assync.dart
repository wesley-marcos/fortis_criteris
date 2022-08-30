import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future main() async {
  var url = 'https://foris-criteris-apiv2.herokuapp.com/criterios/';
  final client = HttpClient();
  final request = await client.openUrl('get', Uri.parse(url));
  request.headers.set('content-type', '/criterios/');

  final response = await request.close();
  
  response.listen((data) {
    final string = utf8.decode(data);
    print(string);
  });
}

