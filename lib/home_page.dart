import 'package:flutter/material.dart';
import 'package:rental/add_product.dart';
import 'package:rental/product/productController/product_cotroller.dart';
import 'package:rental/result_screen.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:rental/shared/sharedWidgets/item_widget.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white, size: 20.0),
        backgroundColor: SharedColors.tealColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddProduc()));
        },
      ),
        body: Container(
          child: context.watch<ProductController>().isGetProductLoading ? Center(
            child: CircularProgressIndicator()
          ) : ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Discover', style: SharedFonts.primaryBlackStyle),
                ),
              ),
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.landscape, color: SharedColors.tealColor, size: 45.0),
                          Text('Landscape', style: SharedFonts.subBlackStyle)
                        ],
                      )
                    );
                  },
                ),
              ),
              customListTile('Popular Destination'),
              Container(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context.watch<ProductController>().allProducts.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(false, context.read<ProductController>().allProducts[index]);
                  },
                ),
              ),
              customListTile('Recently Views'),
              Container(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context.watch<ProductController>().allProducts.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(false, context.read<ProductController>().allProducts[index]);
                  },
                ),
              )
            ],
          ),
        ),
      );
  }

  customListTile(String title) {
    return ListTile(
      title: Text(title, style: SharedFonts.primaryBlackStyle),
      trailing: Container(
        width: 50.0,
        child: Row(
          children: [
            Text('more', style: SharedFonts.subTealStyle),
            Icon(Icons.arrow_forward_ios, color: SharedColors.tealColor, size: 15.0)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen(title)));
        // Navigator.pushNamed(context, 'homePage');
      },
    );
  }
}