import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



// class ApiDataProvider {
//   Future<String?> getData() async {
//     var response = await http.get(
//         Uri.encodeFull("https://eightballapi.com/api") as Uri,);
//     if (response.statusCode == 200) {
//       return response.toString();
//     } else {
//       throw Exception("Что то пошло не так");
//     }
//   }
// }


Future<http.Response> getData() async {
  const url = 'https://eightballapi.com/api';
  return await http.get(Uri.parse(url));
}

void loadData() {
  getData().then((response) {
    if(response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}