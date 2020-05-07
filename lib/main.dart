import 'package:flutter/material.dart';
import 'package:shopak/admin/categories/add_category.dart';
import 'package:shopak/admin/categories/categories.dart';
import 'package:shopak/admin/products/add_product.dart';
import 'package:shopak/admin/products/all_product.dart';

// import 'admin/categories/add_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShopaK",
      home: Home(),
      routes: {
        // '/add_product': (cxt) => AddProduct(),
        '/all_products': (cxt) => AllProducts(),
        '/add_category': (cxt) => AddCategory(),
        '/all_categories': (cxt) => ALLCategories(),
        '/add_product': (ctx) => AddNewProduct(),
      },
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopak"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("hello i'm home"),
        ),
      ),
      drawer: Drawer(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Add Categories"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/add_category');
              },
            ),
            RaisedButton(
              child: Text("All Categories"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/all_categories');
              },
            ),
            RaisedButton(
              child: Text("Add product"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/add_product');
              },
            ),
            RaisedButton(
              child: Text("All products"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/all_products');
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
// this is the linkof firebase auth
import 'package:firebase_auth/firebase_auth.dart';
*/
