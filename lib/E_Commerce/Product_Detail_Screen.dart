import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Product.dart';
import 'Cart_Provider.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 🧾 Get the product passed via Navigator
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),
            Text(product.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(product.description),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addItem(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to cart')),
                  );
                },
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
