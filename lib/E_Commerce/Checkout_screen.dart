import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart_Provider.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _address = '';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 📩 Name Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter your name' : null,
                onSaved: (value) => _name = value!,
              ),
              // 📧 Email Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                value == null || !value.contains('@') ? 'Enter a valid email' : null,
                onSaved: (value) => _email = value!,
              ),
              // 🏠 Address Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter your address' : null,
                onSaved: (value) => _address = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // ✅ Validate form
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // 🎉 Show confirmation
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Order Placed'),
                        content: Text('Thank you, $_name! Your order is on the way.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              cart.clear();
                              Navigator.popUntil(context, ModalRoute.withName('/'));
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
