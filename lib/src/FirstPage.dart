import 'package:flutter/material.dart';
import 'Foundation.dart';
import 'package:flutter/cupertino.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new IconButton(
          icon: new Icon(Icons.arrow_right),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'login', (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
