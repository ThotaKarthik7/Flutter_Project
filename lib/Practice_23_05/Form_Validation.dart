import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: FormValidationDemo()));

class FormValidationDemo extends StatefulWidget {
  @override
  _FormValidationDemoState createState() => _FormValidationDemoState();
}

class _FormValidationDemoState extends State<FormValidationDemo> {
  final _formKey = GlobalKey<FormState>();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'Only alphabets are allowed';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              ElevatedButton(
                child: Text('Validate'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Hello $name')));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
