import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: RowandColumn(),
  ));
}

class RowandColumn extends StatefulWidget {
  const RowandColumn({super.key});

  @override
  State<RowandColumn> createState() => _RowandColumnState();
}

class _RowandColumnState extends State<RowandColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row And column "),backgroundColor: Colors.grey,),

      body: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text("THis is Orange Color", ),

              width: 200,
              height: 100,
              color: Colors.orange,
              margin: EdgeInsets.all(20),
            ),
            Container(
              child: Text("THis is Blue Color"),
              width: 200,
              height: 100,
              color: Colors.blue,

              margin: EdgeInsets.all(10),
            ),
            Container(
              child: Text("THis is Green Color"),
              width: 300,
              height: 100,
              color: Colors.green,
              margin: EdgeInsets.all(30),
            )
          ],
        ),

      ),
    );
  }
}
