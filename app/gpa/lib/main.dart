import 'package:flutter/material.dart';
import './ui/pages/home.dart';
import './ui/pages/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
      initialRoute: HomePage.id,
      routes: {
        ResultsPage.id: (context) => ResultsPage(),
        HomePage.id : (context) => HomePage(),
      },
    );
  }
}

