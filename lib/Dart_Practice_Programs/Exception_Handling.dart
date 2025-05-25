import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String exceptionHandlingDemo() {
    try {
      int result = 10 ~/ 0; // This will throw IntegerDivisionByZeroException
      return 'Result: $result';
    } catch (e) {
      return 'Caught an error: $e';
    } finally {
      // You could log or clean up here
    }
  }

  @override
  Widget build(BuildContext context) {
    String output = exceptionHandlingDemo();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exception Handling')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                output,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'This always runs.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}