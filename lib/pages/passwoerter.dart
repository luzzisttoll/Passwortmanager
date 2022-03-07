import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
              children: <Widget>[
                const Text("Ihre Passwörter",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, height: 5)),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where("passwort")
                      .where("url")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent),
                      );
                    } else if (snapshot.hasData) {
                      print(snapshot.data!.docs);
                    }
                    return const CircularProgressIndicator();
                  },
                ),
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
