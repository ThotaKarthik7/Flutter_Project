import 'package:flutter/material.dart';
import 'Product.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 👇 Responsive: 2 columns on small screens, 4 on large
          int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
          return GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: sampleProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final product = sampleProducts[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product-detail',
                    arguments: product,
                  );
                },
                child: Stack(
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 📦 Product Image with AspectRatio
                          AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Image.network(product.imageUrl, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(product.title, style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('\$${product.price.toStringAsFixed(2)}'),
                          ),
                        ],
                      ),
                    ),
                    if (product.isOnSale)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.red,
                          child: Text(
                            'SALE',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
