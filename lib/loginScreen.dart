import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main()
{
  myLogin app = myLogin();
  runApp(myLogin());

}
class  myLogin extends StatefulWidget {
  const myLogin({super.key});

  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(

        appBar: AppBar(title: Text("This is my login page"), ),
        body:

        Container(
          color: Colors.blue,
          height: 500,
          width: 300,
          margin: EdgeInsets.only(left: 20,right: 30,top: 10, bottom: 650),
          child: Text("Please login Your credentials"),

          ),




      ),

    );
  }
}
