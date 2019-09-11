import 'package:flutter/foundation.dart';
import 'package:piano_dem_hat/models/product.dart';

class ProductProvider with ChangeNotifier {
  Map<String, ProductModel> _products = {};
  Map<String, ProductModel> get products => _products;

  set products(Map<String, ProductModel> newValue) {
    _products = newValue;
    notifyListeners();
  }

}