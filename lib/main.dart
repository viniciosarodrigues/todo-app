import 'package:estudo_mobx/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:estudo_mobx/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'MobX Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          cursorColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.blueAccent,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
