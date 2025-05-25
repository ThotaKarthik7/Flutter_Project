import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Single_Child_Scroll_View" , style: TextStyle(color: Colors.orangeAccent),), backgroundColor: Colors.yellowAccent,),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(25, (index) => ListTile(title: Text(" $index . This Is Single Child View Scroll" , style: TextStyle(color: Colors.indigoAccent),))),
          ),
        ),
      ),
    );
  }
}
