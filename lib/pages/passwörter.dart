import 'package:flutter/material.dart';

class passwoerter extends StatefulWidget {
  const passwoerter({Key? key}) : super(key: key);

  @override
  _passwoerterState createState() => _passwoerterState();
}

class _passwoerterState extends State<passwoerter> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      "Ihre Passwörter",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )));
  }
}
