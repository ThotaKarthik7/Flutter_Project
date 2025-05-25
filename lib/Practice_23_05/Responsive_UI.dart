import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ResponsiveExercise()));

class ResponsiveExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isMobile = size.width < 600;

    return Scaffold(
      appBar: AppBar(title: Text('Responsive UI')),
      body: Center(
        child: isMobile
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildWidgets(),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildWidgets(),
        ),
      ),
    );
  }

  List<Widget> buildWidgets() => [
    Container(width: 100, height: 100, color: Colors.green),
    SizedBox(width: 20, height: 20),
    Container(width: 100, height: 100, color: Colors.blue),
  ];
}

