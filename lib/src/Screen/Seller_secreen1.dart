import 'package:flutter/material.dart';
import 'package:greenguard/src/Screen/screen2.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:greenguard/src/Widgets/product_detail.dart';

class SellerPage extends StatefulWidget {
  final List<Product> productsList;

  SellerPage({required this.productsList});
  @override
  _SellerPageState createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  String _selectedCategory = 'Crops';
  // final _productCategoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _deliveryChargesController = TextEditingController();
  File? _image;

  final List<String> _categories = [
    'Crops',
    'Tools',
    'Pesticides',
    'Crop Guide Manuals',
    'Machineries',
    'Seeds',
    // Add more categories as needed
  ];
  List<Product> productsList = [];

  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _captureImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _navigateToProductScreen(Product productData) {
    // Create a Product instance using the entered data and the selected image

    // Navigate to the ProductScreen and pass the product data
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          productData: productData,
          productsList: productsList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              if (_image != null)
                Image.file(
                  _image!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ElevatedButton(
                onPressed: _getImageFromGallery,
                child: Text('Select Image from Gallery'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _captureImage,
                child: Text('Capture Image'),
              ),
              TextFormField(
                controller: _productNameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productDescriptionController,
                decoration: InputDecoration(labelText: 'Product Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   controller: _productCategoryController,
              //   decoration: InputDecoration(labelText: 'Product Category'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter a product category';
              //     }
              //     return null;
              //   },
              // ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Product Category',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a product category';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _deliveryChargesController,
                decoration: InputDecoration(labelText: 'Delivery Charges'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter delivery charges';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Get values from form fields and create a Product object
                    final productName = _productNameController.text;
                    final productDescription =
                        _productDescriptionController.text;
                    final productCategory = _selectedCategory;
                    final price = double.parse(_priceController.text);
                    final imageFile = _image;

                    final product = Product(
                      productName: _productNameController.text,
                      productDescription: _productDescriptionController.text,
                      productCategory: _selectedCategory,
                      price: price,
                      imageFile: imageFile!, // Use the selected image file
                    );

                    // Add the new product to the productsList
                    productsList.add(product);
                    // Save product data and move to the next screen
                    _navigateToProductScreen(product);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
