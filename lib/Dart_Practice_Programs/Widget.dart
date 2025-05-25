import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyWidget()));

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded vs Flexible")),
      body: Row(
        children: [
          Expanded(
            child: Container(width: 50, color: Colors.red, height: 100),
          ),
          Expanded(
            flex: 2,
            child: Container(width: 50, color: Colors.green, height: 100),
          ),
          Flexible(
            flex: 3,
            child: Container(width: 50, color: Colors.blue, height: 100),
          ),
        ],
      ),
    );
  }
}

 