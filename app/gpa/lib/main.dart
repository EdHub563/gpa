import 'package:flutter/material.dart';
import './ui/pages/home.dart';
import './ui/pages/result.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xffcabbf9), //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffcabbe9),
        accentColor: Color(0xffffcef3),
      ),
      // home: HomePage(),
      initialRoute: HomePage.id,
      routes: {
        ResultsPage.id: (context) => ResultsPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
