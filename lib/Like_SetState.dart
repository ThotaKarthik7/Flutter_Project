import 'package:flutter/material.dart';
void main() {
  runApp(LikeButtonApp());
}
class LikeButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LikeScreen(),
    );
  }
}
class LikeScreen extends StatefulWidget {
  @override
  _LikeScreenState createState() => _LikeScreenState();
}
class _LikeScreenState extends State<LikeScreen> {
  bool isLiked = false;
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Like Button Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
                size: 48,
              ),
              onPressed: toggleLike,
            ),
            Text(
              isLiked ? "You liked this!" : "Tap to like",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
