import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Wrap and Flow Example')),
          body: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(6, (index) =>
              Chip(label: Text('Chip \$index'), backgroundColor:
          Colors.blueAccent)),
    ),

    ),
    );
  }
}