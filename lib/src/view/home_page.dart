import 'package:flutter/material.dart';
import 'package:whale_pet/src/components/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Welcome to Whale Pet!'),
      ),
      drawer: const MainDrawer(),
    );
  }
}
