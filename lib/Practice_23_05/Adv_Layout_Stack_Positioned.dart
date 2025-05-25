import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AdvancedLayoutDemo()));

class AdvancedLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advanced Layouts')),
      body: Stack(
        children: [
          Container(color: Colors.indigo),
          Positioned(
            top: 50,
            left: 30,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('Box 1')),
            ),
          ),
          Positioned(
            top: 50,
          right: 30,
          child: Container(
            width: 200,
            height: 300,
            color: Colors.redAccent,
            child: Center(child: Text('Box 3'),),
          ),
          ),
          Positioned(
            bottom: 50,
            left: 30,
            child: Container(
              width: 200,
              height: 300,
              color: Colors.green,
              child: Center(child: Text('Box 3'),),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 30,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange,
              child: Center(child: Text('Box 2')),
            ),
          ),
        ],
      ),
    );
  }
}

