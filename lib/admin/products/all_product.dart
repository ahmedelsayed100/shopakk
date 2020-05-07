import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: _retriveAllProducts(),
    );
  }

  Widget _retriveAllProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("products").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return errorMessage();
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loading();

          default:
            return new ListView(
              children: snapshot.data.documents.map(
                (DocumentSnapshot documentSnapshot) {
                  return new ListTile(
                    title:
                        new Text(documentSnapshot['product_name'].toString()),
                    subtitle: new Text(
                        documentSnapshot['product_description'].toString()),
                    leading: CircleAvatar(
                        radius: 25,
                        child: new Text(
                            "${documentSnapshot['price'].toString()} \$")),
                  );
                },
              ).toList(),
            );
        }
      },
    );
  }

  Widget loading() {
    return CircularProgressIndicator();
  }

  Widget errorMessage() {
    return Text("oops no data availabel");
  }
}
