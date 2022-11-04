import 'package:flutter/material.dart';
import 'package:rental/product/productController/product_cotroller.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:rental/shared/sharedWidgets/item_widget.dart';
import 'package:provider/provider.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: SharedColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: context.watch<ProductController>().wishlist.isEmpty ? 
        Center(child: Text('No Wishlist Shop Now', style: SharedFonts.primaryBlackStyle)) : ListView.builder(
          itemCount: context.watch<ProductController>().wishlist.length,
          itemBuilder: (context, index) => ItemWidget(true, context.read<ProductController>().wishlist[index]),
        ),
      ),
    );
  }
}


double responsiveGridViewItem(Size size) {

  if (size.height <= 550) {
    return 0.61;
  } else {
    return 0.7;
  }
}