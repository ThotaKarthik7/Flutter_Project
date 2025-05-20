import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_item.dart';


class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;
  double get total => _items.fold(0, (sum, item) => sum + item.price);

  void addItem(CartItem item) {
  _items.add(item);
  notifyListeners();
  }
  void removeItem(CartItem item) {
  _items.remove(item);
  notifyListeners();
  }
}
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartScreen(),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<CartItem> sampleItems = [
    CartItem(name: 'Apple', price: 1.0),
    CartItem(name: 'Banana', price: 0.5),
    CartItem(name: 'Mango', price: 2.0),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sampleItems.length,
              itemBuilder: (context, index) {
                final item = sampleItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cart.addItem(item);
                    },
                  ),
                );
              },
            ),

          ),
          Divider(),
          Text("Total Items: ${cart.items.length}"),
          Text("Total Cost: \$${cart.total.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}