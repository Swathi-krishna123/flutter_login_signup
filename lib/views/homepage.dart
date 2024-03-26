import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(itemBuilder: (context,index){
          return ListTile(tileColor: (index +1) % 5 == 0 ?Colors.blue:Colors.cyan,);
        }, separatorBuilder: (context, index) => const Divider(), itemCount: 50),
      ),
    );
  }
}
