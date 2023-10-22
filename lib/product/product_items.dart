import 'dart:convert';
import 'package:http/http.dart' as http;
class Items{
  int id;
  String title;
  int price;
  String desc;
  int category;
  String image;
  Items({required this.id,required this.price,required this.title,required this.image,required this.category,required this.desc});
  Future<Items> fromJson(int id) async
  {
    final url = "https://api.escuelajs.co/api/v1/products/$id}";
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    return Items(id: json['id'], price: json['price'], title: json['title'], image: json['image'][0], category: json['category'], desc: json['description']);
  }

}