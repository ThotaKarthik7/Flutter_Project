import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(title: Text('Stack and Positioned')),
        body: Stack(
          children: [
            Container(width: double.infinity, height: 300, color: Colors.grey),
            Positioned(top: 50, left: 30, child: Container(width: 100, height: 100,
                color: Colors.red)),
            Positioned(bottom: 20, right: 20, child: Icon(Icons.star, size: 50,
                color: Colors.yellow)),
          ],
        ),
      ),
    );
  }
}