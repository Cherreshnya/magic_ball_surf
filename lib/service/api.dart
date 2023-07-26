import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



Future<String> getData() async {
  const url = 'https://eightballapi.com/api';
  final response = await http.get(Uri.parse(url));
  final bodyMap = jsonDecode(response.body);
  return bodyMap["reading"];
}

//   return await http.get(Uri.parse(url));
//
// }
// loadData() {
//   getData().then((response) {
//     if (response.statusCode == 200) {
//       var jsonAnswer = jsonDecode(response.body)['reading'];
//        print (jsonAnswer);
//     } else {
//       print(response.statusCode);
//     }
//   }).catchError((error) {
//     debugPrint(error.toString());
//   });
//
// }
