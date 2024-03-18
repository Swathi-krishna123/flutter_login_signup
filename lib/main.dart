

import 'package:flutter/material.dart';
import 'package:flutter_app1/views/loginpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login page",
      home: Login(),
    );
  }
}


