import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  Register({ Key? key }) : super(key: key);

  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwortController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late bool? _success;
  late String? _userEmail;

  @override
  Widget build(BuildContext context) {
    bool _success;
    return Scaffold(
      appBar:AppBar(
        title: const Text('Registrieren')
        ),
     body: Center(
       key: FormKey,
        child: Column(
          children: [      
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      "Registrieren Sie sich.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, height: 5)
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: passwortController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Passwort',
                        )
                    ),
                  ),
                ],
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 30),
                ElevatedButton(
                  child: const Text("Registrieren"),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  ),
                  onPressed: () async 
                    {
                     if (FormKey.currentState!.validate()) {
                       _register();
                     }
                    },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } 
  void _navigateToLogin(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
  }

 
  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwortController.text,
      )).user;

  if (user != null) {
    setState() {
      _success = true;
      _userEmail = user.email;
    };
  } else {
    setState() {
      _success = true;
    };
  }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}