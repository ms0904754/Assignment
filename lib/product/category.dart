// import 'dart:convert';
// import 'package:assignment/product/Product_Detail.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
//
//
// class Model extends StatefulWidget {
//   const Model({super.key});
//   @override
//   State<Model> createState() => _ModelState();
// }
//
// class _ModelState extends State<Model> {
//   dynamic Users;
//
//    Future apiCall() async{
//     const url = "https://api.escuelajs.co/api/v1/products";
//     final uri = Uri.parse(url);
//     final response1 = await http.get(uri);
//     setState(() {
//       Users = jsonDecode(response1.body);
//     });
//   }
//   @override
//   void initState() {
//     apiCall();
//     super.initState();
//   }
//   int cnt = 1;
//   @override
//   Widget build(BuildContext context) {
//     // print(Users);
//     return Users==null?const Center(child: CircularProgressIndicator()):SizedBox(
//       height: 300,
//       child: SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (context,index) {
//         return ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: GridTile(
//                   footer: GridTileBar(
//                     leading: Text(Users[index]['price'].toString()),
//                     trailing: const Icon(Icons.add,color: Colors.black,),
//                   ),
//                   child: GestureDetector(child: FadeInImage(image: NetworkImage(Users[index]['images'][0]), placeholder: NetworkImage("https://img.freepik.com/premium-photo/abstract-luxury-gradient-blue_1258-15481.jpg"),
//
//                   ),
//                     onTap: (){
// // print(Users[index]['id']);
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: Users[index]['id'])));
//                     },
//                   ),
//
//                 ),
//               );
//
// // },
// // );
//
//             },
// // physics: NeverScrollableScrollPhysics(),
// // scrollDirection: Axis.horizontal,
//               itemCount: Users.length,
//             ),
//
//     );
//   }
// }
//
