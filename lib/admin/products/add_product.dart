import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              //this is for product name

              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Name",
                  icon: Icon(
                    Icons.shopping_basket,
                  ),
                ),
                controller: _productNameController,
                validator: (value) {
                  if (_productNameController.text.isEmpty) {
                    return "Please enter product name!";
                  }
                  return null;
                },
              ),
              //this is for product description
              SizedBox(
                height: 24,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Description",
                  icon: Icon(
                    Icons.description,
                  ),
                ),
                maxLines: 3,
                controller: _productDescriptionController,
                validator: (value) {
                  if (_productDescriptionController.text.trim().isEmpty) {
                    return "Product description is required!";
                  }
                  return null;
                },
              ),

              //this is for product price
              SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Price",
                  icon: Icon(
                    Icons.attach_money,
                  ),
                ),
                controller: _productPriceController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) {
                  // double price = double.parse(_productPriceController.text);
                  if (_productPriceController.text.isEmpty) {
                    return "Product price is required!";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                child: Text("Add Product"),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Firestore.instance
                        .collection("products")
                        .document()
                        .setData({
                      "product_name": _productNameController.text,
                      "product_description": _productDescriptionController.text,
                      "price": _productPriceController.text,
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
