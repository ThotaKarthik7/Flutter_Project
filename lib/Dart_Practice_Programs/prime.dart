import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final int num = 17;

  bool isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    bool result = isPrime(num);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Prime Number Checker')),
        body: Center(
          child: Text(
            '$num is ${result ? "a Prime" : "not a Prime"} number',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}