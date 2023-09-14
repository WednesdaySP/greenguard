// import 'dart:html';

import 'dart:io';

class Product {
  final String productName;
  final String productDescription;
  final String productCategory;
  final double price;
  final File imageFile; // Image file

  Product({
    required this.productName,
    required this.productDescription,
    required this.productCategory,
    required this.price,
    required this.imageFile,
  });
}
