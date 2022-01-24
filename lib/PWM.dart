import 'package:flutter/material.dart';

class PWM extends StatelessWidget {
  const PWM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Passwortmanager')),
      body: const Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0)
        ),
      ),
    );
  }
}