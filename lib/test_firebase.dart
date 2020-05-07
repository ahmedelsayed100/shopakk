import 'package:flutter/material.dart';
import 'package:shopak/authentication/firebase_auth.dart';

class TestFirebase extends StatefulWidget {
  @override
  _TestFirebaseState createState() => _TestFirebaseState();
}

class _TestFirebaseState extends State<TestFirebase> {
  final TextEditingController _emailTextEditing = TextEditingController();
  final TextEditingController _passwordTextEditing = TextEditingController();
  final FireBaseAuthentication fireBaseAuthentication =
      FireBaseAuthentication();

  @override
  void initState() {
    super.initState();
    print("hello");
    fireBaseAuthentication.getCurrentUser();
  }

  @override
  void dispose() {
    _emailTextEditing.dispose();
    _passwordTextEditing.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test FireBase"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "email"),
              controller: _emailTextEditing,
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "password"),
              controller: _passwordTextEditing,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () async {
                String email = _emailTextEditing.text;
                String password = _passwordTextEditing.text;
                var user =
                    await fireBaseAuthentication.register(email, password);
                print(user);
              },
              child: Text("login"),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () async {
                fireBaseAuthentication.userSignOut();
              },
              child: Text("sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
