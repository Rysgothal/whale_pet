import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

 @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItens(context),
        ],
      ),
    ),
  );
  
  Widget buildHeader(BuildContext context) => Container();
  
  Widget buildMenuItens(BuildContext context) => Container();
}