import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: FormInputDemo()));

class FormInputDemo extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nameController_1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Inputs')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),


            ),
            SizedBox(height: 20,),
            TextField(
              controller: nameController_1,
              decoration: InputDecoration(labelText: 'Enter Your Branch'),
            ),
            SizedBox(height: 40),


            ElevatedButton(
              onPressed: ()
              {
                final name = nameController.text;
                final branch = nameController_1.text;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hello $name Your Branch is $branch')),
                );

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black),
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

