import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String productName;
  final String productDescription;
  final String productCategory;
  final double price;
  final String imageUrl; // Image URL or path

  Product({
    required this.productName,
    required this.productDescription,
    required this.productCategory,
    required this.price,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [
    Product(
      productName: 'Product 1',
      productDescription: 'Description 1',
      productCategory: 'Category A',
      price: 10.0,
      imageUrl: 'assets/images/bg7.jpg',
    ),
    // Add more products
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          // Check if this is the first product in a new category
          final bool isNewCategory = index == 0 ||
              product.productCategory != products[index - 1].productCategory;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isNewCategory)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.productCategory,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ProductCard(product: product),
            ],
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.imageUrl,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(product.productDescription),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
