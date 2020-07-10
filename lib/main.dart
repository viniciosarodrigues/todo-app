import 'package:flutter/material.dart';
import 'package:estudo_mobx/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        cursorColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.blueAccent,
      ),
      home: LoginScreen(),
    );
  }
}
