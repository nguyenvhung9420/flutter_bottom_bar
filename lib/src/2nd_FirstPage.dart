import 'package:flutter/material.dart';
import 'Foundation.dart';
import 'package:flutter/cupertino.dart';

class Next_FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: new OutlineButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
      ),
    );
  }
}
