// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Category{
//   List<dynamic> Users = [];
//   void Request() async
//   {
//     const url = "https://api.escuelajs.co/api/v1/products";
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final json = jsonDecode(response.body);
//   }
//
//   void getbyProd(int id) async{
//     final url1 = "https://api.escuelajs.co/api/v1/products/<${id}>";
//     final uri1 = Uri.parse(url1);
//     final response1 = await http.get(uri1);
//     final json1 = jsonDecode(response1.body);
//     Users = json1;
//   }
// }
