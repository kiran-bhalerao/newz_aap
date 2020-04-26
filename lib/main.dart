import 'package:flutter/material.dart';
import 'package:newz_aap/screens/Details.dart';
import 'package:newz_aap/screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF6A3BF1),
        accentColor: Color(0xFF985DCC),
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routerName: (ctx) => HomeScreen(),
        DetailScreen.routerName: (ctx) => DetailScreen(),
      },
    );
  }
}
