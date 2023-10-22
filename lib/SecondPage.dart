import 'dart:convert';
import 'package:assignment/product/Product_Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  dynamic Users;
  dynamic catergoryUser;
  // dynamic categoryUser ;

  // Future category(int id) async{
  //   final url2 = "https://api.escuelajs.co/api/v1/categories/$id";
  //   final uri2 = Uri.parse(url2);
  //   final response2 = await http.get(uri2);
  //   setState(() {
  //     Users = jsonDecode(response2.body);
  //   });
  // }



  Future apiCall() async{
    const url = "https://api.escuelajs.co/api/v1/products";
    final uri = Uri.parse(url);
    final response1 = await http.get(uri);
    setState(() {
      Users = jsonDecode(response1.body);
    });
  }


  category(int id)
  {
   setState(() {
    final user = (Users as List<dynamic>).where((element) => element['category']['id']==id);
    catergoryUser = user.toList();
   });
  }





  @override
  void initState() {
    apiCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(Users);
    print("hi");
    if(catergoryUser!=null)
      {
        print(catergoryUser);
        // print(catergoryUser['title']);
        // print(catergoryUser['title']);
        print("hello");
      }
    // print(catergoryUser.length);
    return Users==null?const Center(child: CircularProgressIndicator()):Expanded(
      flex: 1,
      child: CustomScrollView(
        slivers: [

          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
              background: CupertinoScrollbar(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10), itemBuilder: (context,ind){
                  return  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: catergoryUser!=null?catergoryUser[ind]['id']:Users[ind]['id'])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInImage(
                        placeholder: const NetworkImage("https://img.freepik.com/premium-photo/abstract-luxury-gradient-blue_1258-15481.jpg"),
                        image: NetworkImage(catergoryUser!=null?catergoryUser[ind]['images'][0]:Users[ind]['images'][0]),
                        // child: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     height: 250,
                        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(catergoryUser!=null?catergoryUser[0]['images'][ind]:Users[0]['images'][ind]))),
                        //   ),
                        // ),
                      ),
                    ),
                  );

                },itemCount: catergoryUser!=null?catergoryUser[0]['images'].length:Users[0]['images'].length,scrollDirection: Axis.horizontal,
                ),
              ),
    )
            ),
          SliverList(delegate: SliverChildListDelegate([
            // InkWell(
            //   onTap: (){},
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: 250,
            //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(catergoryUser!=null?catergoryUser[0]['category']['image']:Users[0]['category']['image']))),
            //     ),
            //   ),
            // ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: InkWell(
                      onTap: (){
                       setState(() {
                         category(1);
                       });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                        ),
                        child: const Center(child: Text("Clothes",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        category(2);
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                        ),
                        child: const Center(child: Text("Electronics",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        category(3);
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                        ),
                        child: const Center(child: Text("Furniture",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        category(4);
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                        ),
                        child: const Center(child: Text("Shoes",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        category(5);
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                        ),
                        child: const Center(child: Text("others",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("New Arrival",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){}, child: Text("See All",style: TextStyle(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
            SizedBox(height: 10,),
          ]
          )
          ),
          SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (context,index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GridTile(
                footer: ListTile(
                  leading: Text(catergoryUser!=null?'\$${catergoryUser[index+3]['price']}':'\$${Users[index+3]['price']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  trailing: SizedBox(
                      width: 50,
                    height: 40
                    ,child: ElevatedButton(onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),child: const Center(child: Icon(Icons.add,color: Colors.white,)),)),
                ),
                child: GestureDetector(child: FadeInImage(image: NetworkImage(catergoryUser!=null?catergoryUser[index+3]['images'][0]:Users[index+3]['images'][0]), placeholder: NetworkImage("https://img.freepik.com/premium-photo/abstract-luxury-gradient-blue_1258-15481.jpg"),

                ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(id: catergoryUser!=null?catergoryUser[index+3]['id']:Users[index+3]['id'])));
                  },
                ),

              ),
            );
          },
            itemCount: catergoryUser==null?Users.length:catergoryUser.length,
          ),
        ],
      ),
    );
  }
}
