import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart_Provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.items.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: Image.network(item.imageUrl, width: 50),
                  title: Text(item.title),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () => cart.removeItem(item.id),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
              child: Text('Proceed to Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
