import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveHome(),
    );
  }
}
class ResponsiveHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Day 3 - Advanced Layouts")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 600
              ? Row(
            children: [
              Expanded(child: CustomCard("Card 1")),
              Expanded(child: CustomCard("Card 2")),
            ],
          )
              : Column(
            children: [
              CustomCard("Card 1"),
              CustomCard("Card 2"),
            ],
          );
        },
      ),
    );
  }
}
class CustomCard extends StatelessWidget {
  final String title;
  CustomCard(this.title);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}