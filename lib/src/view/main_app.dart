import 'package:flutter/material.dart';
import 'package:whale_pet/src/view/home_page.dart';
// import 'package:whale_pet/src/view/loading_page.dart';
//import 'package:my_app/src/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whale Pet',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}