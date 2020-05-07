import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _catgoryTitleController = TextEditingController();

  @override
  void dispose() {
    _catgoryTitleController.dispose();
    super.dispose();
  }

  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
      ),
      body: (_isAdded) ? loading() : _categoryForm(),
    );
  }

  Widget _categoryForm() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _catgoryTitleController,
              decoration: InputDecoration(labelText: "Category title"),
              validator: (value) {
                if (_catgoryTitleController.text.isEmpty) {
                  return "Cyegory title is required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: RaisedButton(
                child: Text("Add Cayegory"),
                onPressed: () async {
                  setState(() {
                    _isAdded = true;
                  });
                  var response = await Firestore.instance
                      .collection('categories')
                      .where('category_title',
                          isEqualTo: _catgoryTitleController.text)
                      .snapshots()
                      .first;
                  if (response.documents.length >= 1) {
                    print("11");
                    setState(() {
                      _isAdded = false;
                      _catgoryTitleController.text = "";
                    });
                    return "this category already exist";
                  } else {
                    // if (_formKey.currentState.validate()) {
                    Firestore.instance
                        .collection('categories')
                        .document()
                        .setData({
                      "category_title": _catgoryTitleController.text,
                    }).then((onValue) {
                      setState(() {
                        _isAdded = false;
                      });
                      _catgoryTitleController.text = "";
                    });
                  }
                  // }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
