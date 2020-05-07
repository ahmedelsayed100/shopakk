import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ALLCategories extends StatefulWidget {
  @override
  _ALLCategoriesState createState() => _ALLCategoriesState();
}

class _ALLCategoriesState extends State<ALLCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catgories"),
      ),
      body: _retriveAllCategories(),
    );
  }

  Widget _retriveAllCategories() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("categories").snapshots(),
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
                    title: Text(
                      documentSnapshot['category_title'].toString(),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          child: AlertDialog(
                            content: Text("Do you really  want to delete?"),
                            actions: <Widget>[
                              RaisedButton(
                                child: Text("No"),
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              RaisedButton(
                                child: Text("Yes"),
                                color: Colors.red,
                                onPressed: () {
                                  Navigator.pop(context);
                                  Firestore.instance
                                      .collection('categories')
                                      .document(documentSnapshot.documentID)
                                      .delete();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      color: Colors.red,
                    ),
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
