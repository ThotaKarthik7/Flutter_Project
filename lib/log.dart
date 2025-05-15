import 'package:flutter/material.dart';

void main() {
  runApp(myLogin());
}

class myLogin extends StatefulWidget {
  const myLogin({super.key});

  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is my login page"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 300,
            child: Text(
              "Please login with your credentials",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
