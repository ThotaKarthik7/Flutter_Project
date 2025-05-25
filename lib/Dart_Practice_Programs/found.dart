import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.indigo,
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Concepts Demo',
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Flutter UI Concepts'),
                  background: AspectRatio(
                    aspectRatio: 18 / 9,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Icon(Icons.dashboard, color: Colors.green),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child:
                constraints.maxWidth > 600 ? WideLayout() : NarrowLayout(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: InfoPanel()),
        VerticalDivider(),
        Expanded(child: CustomFormCard()),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoPanel(),
        Divider(),
        CustomFormCard(),
      ],
    );
  }
}

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Welcome to the Adaptive UI Demo\n(Resize screen to see responsiveness)',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CustomFormCard extends StatefulWidget {
  @override
  _CustomFormCardState createState() => _CustomFormCardState();
}

class _CustomFormCardState extends State<CustomFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isIOS = defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(24),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Login Form',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _isIOS
                  ? CupertinoButton.filled(
                child: Text('Submit'),
                onPressed: _submit,
              )
                  : ElevatedButton(
                child: Text('Submit'),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted: ${_emailController.text}')),
      );
    }
  }
}