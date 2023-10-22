import 'package:assignment/Home_page.dart';
import 'package:assignment/SecondPage.dart';
import 'package:assignment/product/category.dart';
import 'package:assignment/sample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage()
      // home: Model(),
    );
  }
}
