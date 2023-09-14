import 'package:flutter/material.dart';
import 'package:greenguard/src/Screen/prd_des.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SellerPage extends StatefulWidget {
  @override
  _SellerPageState createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  // String _selectedCategory = '';
  final _productCategoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _deliveryChargesController = TextEditingController();
  File? _image;

  // final List<String> _categories = [
  //   'Crops',
  //   'Tools',
  //   'Pesticides',
  //   'Crop Guide Manuals',
  //   'Machineries',
  //   // Add more categories as needed
  // ];

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

  void _navigateToNextScreen() {
    // Implement navigation logic to move to the next screen
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProductScreen()));
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
              TextFormField(
                controller: _productCategoryController,
                decoration: InputDecoration(labelText: 'Product Category'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product category';
                  }
                  return null;
                },
              ),
              // DropdownButtonFormField<String>(
              //   value: _selectedCategory,
              //   onChanged: (value) {
              //     setState(() {
              //       _selectedCategory = value!;
              //     });
              //   },
              //   items: _categories.map((category) {
              //     return DropdownMenuItem<String>(
              //       value: category,
              //       child: Text(category),
              //     );
              //   }).toList(),
              //   decoration: InputDecoration(
              //     labelText: 'Product Category',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please select a product category';
              //     }
              //     return null;
              //   },
              // ),
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save product data and move to the next screen
                    _navigateToNextScreen();
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
