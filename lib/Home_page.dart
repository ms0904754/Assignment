import 'package:assignment/SecondPage.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height*0.9,
            child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(radius: 30,backgroundImage: NetworkImage("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/316600/316605.png"),),
                              title: Text("Name"),
                              subtitle: Text("location"),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(onPressed: () {}, icon: Icon(Icons.notifications,color: Colors.black,)),
                                    IconButton(onPressed: () {}, icon: Icon(Icons.horizontal_split_rounded,color: Colors.black,))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            child: TextField(decoration: InputDecoration(
                              // labelText: "search",
                              label: SizedBox(
                                // width: 10,
                                child: Row(
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(width: 20,),
                                    Text("search for brand",style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
                            ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          const SecondPage()

                        ],
                  ),
          ),
          ),
    );
  }
}
