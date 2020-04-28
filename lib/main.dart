import 'package:flutter/material.dart';
import 'package:shopak/authentication/authenticatable.dart';
import 'package:shopak/authentication/firebase_authentication.dart';
import 'package:shopak/screens/hoem_screen.dart';

void main() {
  Authenticatable authenticatable = FireBaseAuthentication();
  authenticatable.login("email", "");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShopaK",
      home: HomeScreen(),
    );
  }
}
