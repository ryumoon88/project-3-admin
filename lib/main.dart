import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/products/product_add_screen.dart';
import 'package:project/screens/products/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
          );
        }
        if (settings.name == "/products") {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ProductsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final transition = animation
                  .drive(Tween(begin: const Offset(1, 0), end: Offset.zero));
              return SlideTransition(
                position: transition,
                child: child,
              );
            },
          );
        }
        if (settings.name == "/products/add") {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ProductAddScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final transition = animation
                  .drive(Tween(begin: const Offset(0, 1), end: Offset.zero));
              return SlideTransition(
                position: transition,
                child: child,
              );
            },
          );
        }
        return null;
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
    );
  }
}
