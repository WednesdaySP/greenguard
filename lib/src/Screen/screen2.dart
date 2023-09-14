// import 'package:flutter/material.dart';

// class Product {
//   final String productName;
//   final String productDescription;
//   final String productCategory;
//   final double price;
//   final String imageUrl; // Image URL or path

//   Product({
//     required this.productName,
//     required this.productDescription,
//     required this.productCategory,
//     required this.price,
//     required this.imageUrl,
//   });
// }

// class ProductScreen extends StatelessWidget {
//   final List<Product> products;

//   ProductScreen({required this.products});

//   @override
//   Widget build(BuildContext context) {
//     // Create a map to group products by category
//     Map<String, List<Product>> groupedProducts = {};

//     // Group products by category
//     for (var product in products) {
//       if (!groupedProducts.containsKey(product.productCategory)) {
//         groupedProducts[product.productCategory] = [];
//       }
//       groupedProducts[product.productCategory]!.add(product);
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Screen'),
//       ),
//       body: ListView.builder(
//         itemCount: groupedProducts.length,
//         itemBuilder: (context, index) {
//           final category = groupedProducts.keys.elementAt(index);
//           final categoryProducts = groupedProducts[category]!;

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   category,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ),
//               GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: categoryProducts.length,
//                 itemBuilder: (context, index) {
//                   final product = categoryProducts[index];
//                   return ProductCard(product: product);
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Product product;

//   ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(
//             product.imageUrl,
//             width: double.infinity,
//             height: 150.0,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.productName,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.0,
//                   ),
//                 ),
//                 Text(product.productDescription),
//                 Text(
//                   '\$${product.price.toStringAsFixed(2)}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/product_detail.dart';

class ProductScreen extends StatelessWidget {
  final Product productData;

  ProductScreen({required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              productData.imageFile,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(productData.productDescription),
                  Text(
                    '\$${productData.price.toStringAsFixed(2)}',
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
      ),
    );
  }
}
