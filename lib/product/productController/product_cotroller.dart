import 'package:flutter/foundation.dart';
import 'package:rental/product/productModel/product_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProductController with ChangeNotifier, DiagnosticableTreeMixin {

  List<ProductModel> _products = [];
  List<ProductModel> get allProducts => _products;

  List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;

  void addProduct(String name, bool isFav, String img) async {

    Map<String, dynamic> data = {
      "productName" : name,
      "productImage" : img
    };

    http.Response response = await http.post(
      Uri.parse('https://rental-cff3d-default-rtdb.firebaseio.com/products.json'),
      body: json.encode(data)
    );

    ProductModel newProduct = ProductModel(name, isFav, img);
    _products.add(newProduct);
    notifyListeners();
  }

  bool _isGetProductLoading = false;
  bool get isGetProductLoading => _isGetProductLoading;


  void getProducts() async {

    _isGetProductLoading = true;
    notifyListeners();

    http.Response res = await http.get(Uri.parse('https://rental-cff3d-default-rtdb.firebaseio.com/products.json'));

    Map data = json.decode(res.body);

    data.forEach((k, v) {
      _products.add(ProductModel(v['productName'], false, v['productImage']));
    });

    _isGetProductLoading = false;
    notifyListeners();
  }

  void _addToWishList(ProductModel product) {
    product.isFav = true;
    _wishlist.add(product);
    notifyListeners();
  }

  void _removeFromWishlist(ProductModel product) {
    product.isFav = false;
    for (int i = 0; i < wishlist.length; i++) {
      if (_wishlist[i].name == product.name) {
        _wishlist.removeAt(i);
      }
    }
    notifyListeners();
  }

  void handleWishlist(ProductModel product) {
    if (product.isFav!) {
      _removeFromWishlist(product);
    } else {
      _addToWishList(product);
    }
  }
}