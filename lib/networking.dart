import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// dependencies in pubspec - http: ^0.12.1

class NetworkHelper {
  NetworkHelper({@required this.url});
  String url;

  Future getData() async{
    http.Response response =  await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else {
      print(response.body);
    }
  }
}