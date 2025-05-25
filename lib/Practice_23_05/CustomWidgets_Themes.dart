import 'package:flutter/material.dart';

void main() => runApp(MyThemedApp());

class MyThemedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(

        appBar: AppBar( backgroundColor: Colors.blue,title: Text('Custom Widget & Theme', style: TextStyle(color: Colors.black),)),

        body: Center(child: MyCustomCard()),
      ),
    );
  }
}

class MyCustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(20),
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Text('Hello from a custom widget!',
            style: Theme.of(context).textTheme.headlineLarge),

      ),
    );
  }
}

