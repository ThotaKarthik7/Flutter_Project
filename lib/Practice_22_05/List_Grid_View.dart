import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: Text("ListView and GridView" , style: TextStyle(color: Colors.orange),)),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    "This is List View $index", // ✅ Correct string interpolation
                    style: TextStyle(color: Colors.black), // ✅ Text color
                  ),
                  tileColor: Colors.green, // ✅ Background color of each ListTile
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(2, (index) => Card(color: Colors.blue, child: Center(child: Text("This is Grid ")))),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
