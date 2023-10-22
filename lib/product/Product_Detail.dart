import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductDetail extends StatefulWidget {
  int id;
   ProductDetail({super.key, required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}


class _ProductDetailState extends State<ProductDetail> {
  dynamic prodId;
  Future productbyid(int id) async {
    final response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products/$id"));
    if(response.statusCode==200)
    {
      setState(() {
        prodId = jsonDecode(response.body);
      });
    }
  }
  int cnt=0;
  @override
  void initState() {
    print("a");
     productbyid(widget.id);
     super.initState();
     print("b");
     cnt=1;
  }

  @override
  Widget build(BuildContext context) {
    // productbyid(widget.id);
    // print(cnt);
    print(prodId);
    return prodId==null?Scaffold(body: Center(child: CircularProgressIndicator())):SafeArea(
      child: Scaffold( // context ke andar listner property bhi hai or uski by default value true hoti hai
        body: CustomScrollView(
          slivers: [
            SliverAppBar(expandedHeight: 400,
              pinned: true,
              // leadingWidth: 200,
              // foregroundColor: Colors.white,
              backgroundColor: Colors.white,
              //pinned se ye hoga scroll ke baad bhi visible hoga
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(prodId['title']),
                  centerTitle: true,
                  background: Hero(tag: prodId['id'].toString(),
                      // child: Image.network(prodId['images'][0], fit: BoxFit
                      //     .cover)
                    child: CupertinoScrollbar(
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10), itemBuilder: (context,ind) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(prodId['images'][ind],
                                ),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                            
                          ),
                        );
                      },scrollDirection: Axis.horizontal,itemCount: prodId['images'].length,),
                    ),
                  )
              ),
            ),
            SliverList(delegate: SliverChildListDelegate([
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.03,),
              ListTile(
                leading: Text(prodId['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                trailing: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('\$${prodId['price']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      // IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart),),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: () {}, child: Icon(Icons.shopping_cart),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black87),minimumSize: MaterialStateProperty.all(Size(15, 30)),),)
                    ],
                  ),
                ),
              ),
              // Container(width: double.infinity, child: Text(
              //   prodId['price'].toString(),
              //   style: TextStyle(color: Colors.grey,),
              //   textAlign: TextAlign.center,)),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.01,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(child: Text(prodId['description'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54),)),
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.22,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(onPressed: () {}, child: Text("Buy Now"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(4),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),),
              )
            ]),
            ),
          ],
        ),
      ),
    );
  }
}



