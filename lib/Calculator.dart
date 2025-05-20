import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '';

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '⌫') {
        _input = _input.isNotEmpty ? _input.substring(0, _input.length - 1) : '';
      } else if (value == '=') {
        try {
          _result = _calculate(_input);
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }



  String _calculate(String expression) {
    expression = expression.replaceAll('×', '*').replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toStringAsFixed(2);
    } catch (e) {
      return 'Error';
    }
  }


  double _evaluate(String exp) {
    final parser = RegExp(r'(\d+\.?\d*|\+|\-|\*|/)+');
    final tokens = parser.allMatches(exp).map((e) => e.group(0)!).toList();

    List<double> values = [];
    List<String> ops = [];

    for (var token in tokens) {
      if (double.tryParse(token) != null) {
        values.add(double.parse(token));
      } else {
        while (ops.isNotEmpty && _hasPrecedence(token, ops.last)) {
          double b = values.removeLast();
          double a = values.removeLast();
          String op = ops.removeLast();
          values.add(_applyOperator(a, b, op));
        }
        ops.add(token);
      }
    }

    while (ops.isNotEmpty) {
      double b = values.removeLast();
      double a = values.removeLast();
      String op = ops.removeLast();
      values.add(_applyOperator(a, b, op));
    }

    return values.first;
  }

  bool _hasPrecedence(String op1, String op2) {
    if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-')) {
      return false;
    }
    return true;
  }

  double _applyOperator(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return b != 0 ? a / b : 0;
      default:
        return 0;
    }
  }

  Widget _buildButton(String text, {Color? color}) {
    return ElevatedButton(
      onPressed: () => _onPressed(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.grey[300],
        foregroundColor: Colors.black,
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
      ),
      child: Text(text, style: const TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      ['C', '⌫', '', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['0', '.', '=', ''],
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_input, style: const TextStyle(fontSize: 32)),
                    const SizedBox(height: 10),
                    Text(_result, style: const TextStyle(fontSize: 24, color: Colors.blue)),
                  ],
                ),
              ),
            ),
            ...buttons.map((row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row.map((btn) {
                  return btn.isEmpty
                      ? const SizedBox(width: 70)
                      : _buildButton(
                    btn,
                    color: ['+', '-', '×', '÷', '='].contains(btn)
                        ? Colors.orange
                        : (btn == 'C' ? Colors.redAccent : null),
                  );
                }).toList(),
              );
            }).toList(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
