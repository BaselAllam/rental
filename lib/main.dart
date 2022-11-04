import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/login_screen.dart';
import 'package:rental/product/productController/map_controller.dart';
import 'package:rental/product/productController/product_cotroller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
      ],
      child: X(),
    )
  );
}

class X extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // routes: {
      //   'homePage' : (context) => HomePage(),
      // },
    );
  }
}