import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart_Provider.dart';
import 'Product_List_Screen.dart';
import 'Product_Detail_Screen.dart';
import 'Cart_screen.dart';
import 'Checkout_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/product-detail': (context) => ProductDetailScreen(),
          '/cart': (context) => CartScreen(),
          '/checkout': (context) => CheckoutScreen(),
        },
      ),
    );
  }
}
