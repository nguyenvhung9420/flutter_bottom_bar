import 'package:flutter/material.dart';
import 'src/MyHomePage.dart';
import 'src/Foundation.dart';
import 'package:flutter/cupertino.dart';
import 'src/2nd_FirstPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // if (isIos) {
    //   return CupertinoApp(
    //     theme: CupertinoThemeData(
    //         barBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    //         primaryColor: CupertinoColors.destructiveRed),
    //     home: MyHomePage(
    //       title: "Ios",
    //     ),
    //   );
    // } else {
    return MaterialApp(
      // theme: ThemeData.dark(),
      // home: MyHomePage(
      //   title: "Android",
      // ),
      initialRoute: 'login',
      routes: {
        'login': (context) => Next_FirstPage(),
        '/': (context) => MyHomePage(title: "Android"),
      },
    );
  }
}
// }
