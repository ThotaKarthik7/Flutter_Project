import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AdaptiveUIDemo()));

class AdaptiveUIDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Adaptive UI')),
      body: Center(
        child: Container(
          color: Colors.teal,
          width: width < 600 ? 200 : 400,
          height: 100,
          child: Center(
            child: Text('Screen Width: ${width.toStringAsFixed(0)}',
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

