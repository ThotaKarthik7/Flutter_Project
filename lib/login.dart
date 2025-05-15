import 'package:flutter/material.dart';

void main() {
  runApp(MyWidgetsDemo());
}

class MyWidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget Examples'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is a Text widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Image.network(
                'https://flutter.dev/images/flutter-logo-sharing.png',
                height: 100,
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.thumb_up, color: Colors.blue),
                ],
              ),

              SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter something',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  print('Button Pressed');
                },
                child: Text('Click Me'),
              ),

              SizedBox(height: 10),

              Container(
                height: 50,
                width: double.infinity,
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'This is a Container widget',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
