import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,

        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 18, color: Colors.orange)),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Theme" , style: TextStyle(color: Colors.orange),), backgroundColor: Colors.yellowAccent,),
        body: Center(child: Text("Hello with Custom Theme!")),
      ),
    );
  }
}
