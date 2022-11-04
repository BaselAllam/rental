import 'package:flutter/material.dart';
import 'package:rental/product/productController/product_cotroller.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:rental/shared/sharedWidgets/item_widget.dart';
import 'package:provider/provider.dart';


class ResultScreen extends StatefulWidget {
  final String screenName;
  const ResultScreen(this.screenName, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(widget.screenName, style: SharedFonts.subTealStyle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: SharedColors.tealColor,
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListView.builder(
          itemCount: context.watch<ProductController>().allProducts.length,
          itemBuilder: (context, index) => ItemWidget(true, context.read<ProductController>().allProducts[index]),
        ),
      ),
    );
  }
}