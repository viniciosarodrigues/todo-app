import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Image.asset(
          "assets/images/logo.png",
          height: 120,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
