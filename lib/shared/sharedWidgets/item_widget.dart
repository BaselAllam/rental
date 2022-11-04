import 'package:flutter/material.dart';
import 'package:rental/product/productController/product_cotroller.dart';
import 'package:rental/product/productModel/product_model.dart';
import 'package:rental/shared/sharedTheme/sharedColor.dart';
import 'package:rental/shared/sharedTheme/sharedFonts.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatefulWidget {
  final bool isWishlistScreen;
  final ProductModel model;
  const ItemWidget(this.isWishlistScreen, this.model, {Key? key}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(widget.model.img!),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text(widget.model.name!, style: SharedFonts.subBlackStyle),
            subtitle: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Icon(Icons.star, color: Colors.amber, size: 15.0),
              ],
            ),
            trailing: IconButton(
              icon: Icon(widget.model.isFav! ? Icons.favorite : Icons.favorite_border),
              color: widget.model.isFav! ? Colors.red : SharedColors.greyColor,
              iconSize: 20.0,
              onPressed: () {
                Provider.of<ProductController>(context, listen: false).handleWishlist(widget.model);
              },
            ),
          ),
        ],
      ),
    );
  }
}
