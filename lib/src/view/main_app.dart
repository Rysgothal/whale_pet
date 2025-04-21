import 'package:flutter/material.dart';
import 'package:whale_pet/src/view/home_page.dart';
import 'package:window_size/window_size.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle("Whale Pet");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whale Pet',
      initialRoute: '/',      
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFF8E1), // Offwhite color
      ),
      routes: {
      '/': (context) => HomePage(),
      },
    );
  }
}