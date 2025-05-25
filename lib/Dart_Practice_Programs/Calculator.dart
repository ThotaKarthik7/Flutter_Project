import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String operation = '+';
  String result = '';

  void calculate() {
    double a = double.tryParse(num1Controller.text) ?? 0;
    double b = double.tryParse(num2Controller.text) ?? 0;
    double res;

    switch (operation) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '*':
        res = a * b;
        break;
      case '/':
        res = b != 0 ? a / b : double.nan;
        break;
      default:
        result = 'Invalid operation';
        return;
    }

    setState(() {
      result = 'Result: $res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            DropdownButton<String>(
              value: operation,
              onChanged: (String? newValue) {
                setState(() {
                  operation = newValue!;
                });
              },
              items: ['+', '-', '*', '/']
                  .map<DropdownMenuItem<String>>((String op) {
                return DropdownMenuItem<String>(
                  value: op,
                  child: Text(op),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
