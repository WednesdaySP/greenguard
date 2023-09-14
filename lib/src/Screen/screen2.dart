import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenguard/src/Screen/Seller_secreen1.dart';
import 'package:greenguard/src/Screen/prd_des.dart';

import '../Widgets/product_cart.dart';
import '../Widgets/product_detail.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> productsList;
  final Product productData;

  ProductScreen({required this.productData, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.add), // Use an "Add" icon
            onPressed: () {
              // Navigate to SellerPage when the button is pressed
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => SellerPage(
                          productsList: productsList,
                        )),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Image.file(
      //         productData.imageFile,
      //         width: double.infinity,
      //         height: 200.0,
      //         fit: BoxFit.cover,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               productData.productName,
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16.0,
      //               ),
      //             ),
      //             Text(productData.productDescription),
      //             Text(
      //               '\$${productData.price.toStringAsFixed(2)}',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18.0,
      //                 color: Colors.green,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          final product = productsList[index];
          return ProductCard(
            product: product,
          );
        },
      ),
    );
  }
}
