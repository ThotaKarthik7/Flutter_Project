import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: AspectFittedDemo()));

class AspectFittedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AspectRatio & FittedBox')),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.blue,
              child: Center(child: Text('16:9 Box', style: TextStyle(color: Colors.black))),
            ),
          ),
          SizedBox(height: 20),
          FittedBox(
            child: Container(
              color: Colors.orange,
              child: Text('This is a long text that fits'),
            ),
          ),
        ],
      ),
    );
  }
}

