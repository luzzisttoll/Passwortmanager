import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pwm/pages/ausgabe.dart';
import 'package:pwm/pages/passworteingabe.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Passwoerter extends StatefulWidget {
  const Passwoerter({Key? key}) : super(key: key);

  @override
  _PasswoerterState createState() => _PasswoerterState();
}

class _PasswoerterState extends State<Passwoerter> {
  static int counter = 0;
  User? user = FirebaseAuth.instance.currentUser;
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
                      .where(("email"),
                          isEqualTo: ("luca.mangeng@student.htldornbirn.at"))
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    List<Map> Passwortdaten = [];
                    if (snapshot.hasData) {
                      snapshot.data!.docs.forEach((element) {
                        Passwortdaten.add({
                          "passwort": element["passwort 0"],
                          "url": element["url 0"]
                        });
                      });
                      return Column(
                        children: [
                          ...(Passwortdaten).map((Daten) {
                            return ausgabe(data: Daten);
                          })
                        ],
                      );
                    } else {
                      return Container();
                    }
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
