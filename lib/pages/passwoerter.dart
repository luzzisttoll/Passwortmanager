import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pwm/pages/passworteingabe.dart';

class Passwoerter extends StatefulWidget {
  const Passwoerter({Key? key}) : super(key: key);

  @override
  _PasswoerterState createState() => _PasswoerterState();
}

class _PasswoerterState extends State<Passwoerter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Ihre Passwörter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, height: 5)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Eingabe()),
          );
        },
        backgroundColor: Colors.red.shade600,
        child: const Icon(Icons.add, color: Colors.white),
        tooltip: "Neues Passwort",
        heroTag: "formular",
      ),
    );
  }
}
