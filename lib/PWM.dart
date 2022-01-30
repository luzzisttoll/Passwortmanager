import 'package:flutter/material.dart';

import 'main.dart';

class PWM extends StatelessWidget {
  const PWM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passwortmanager')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Willkommen zurück",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Name",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "Email",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
