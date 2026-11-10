import 'package:flutter/material.dart';
import 'shopping_cart_page.dart';

void main() => runApp(const MyApp());

// The root widget of the Campus Store app.
// Sets up the MaterialApp and shows the shopping cart page as the home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Store',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2563EB)),
      ),
      home: const ShoppingCartPage(),
    );
  }
}
