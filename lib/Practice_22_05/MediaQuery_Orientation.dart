import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;
          final screenWidth = MediaQuery.of(context).size.width;

          return Scaffold(
            appBar: AppBar(title: Text("MediaQuery & OrientationBuilder")),
            body: Center(
              child: Text(
                isPortrait ? "Portrait Mode - Width: $screenWidth" : "Landscape Mode - Width: $screenWidth",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
