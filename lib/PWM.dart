// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';

class PWM extends StatelessWidget {
  const PWM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Passwortmanager')),
      body: Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0)
        ),
      ),
    );
  }
}