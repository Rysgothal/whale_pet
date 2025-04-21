import 'package:flutter/material.dart';
import 'package:whale_pet/src/model/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Row(
            children: [
              ElevatedButton(
              onPressed: () async {
                DBConnection db = DBConnection.instance;
                await db.dbConnection.then((value) {
                  value.execute('''insert into tutor (name, email, phone, address) 
                    values ("Lucas", "teste", "ADADAD", "TESTESTE")''');
                });
              },
              child: const Text('Clique aqui'),
              ),
            ],
            ),
          )
    );
  }
}