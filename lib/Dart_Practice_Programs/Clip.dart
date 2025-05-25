import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyStackDemo()));

class MyStackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/Tree.jpeg", // CORS-safe image URL
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                color: Colors.grey[300],
                child: Center(child: Text("Image failed to load")),
              );
            },
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              child: Text("Click Me"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Button Pressed")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

