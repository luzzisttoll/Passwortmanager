import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pwm/models/user_model.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final emailController = TextEditingController();
  final passwortController = TextEditingController();
  final confirmpasswortController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Registrieren')),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text("Registrieren Sie sich.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 5)),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Geben Sie bitte eine Email ein");
                        }

                        if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]") //nur richtige emails werden zugelassen(richtiges format)
                            .hasMatch(value)) {
                          return ("Bitte geben Sie eine gültige Email ein");
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        textInputAction: TextInputAction.next,
                        autofocus: false,
                        controller: passwortController,
                        obscureText: true,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^.{6,}$'); //Passwort muss 6 Zeichen lang sein
                          if (value!.isEmpty) {
                            return ("Geben Sie bitte ihr Passwort ein");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Bitte gültiges Passwort eingeben");
                          }
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          border: UnderlineInputBorder(),
                          labelText: 'Passwort',
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        textInputAction: TextInputAction.done,
                        autofocus: false,
                        controller: confirmpasswortController,
                        obscureText: true,
                        validator: (value) {
                          if (confirmpasswortController
                                  .text != //Input in Textfeldern muss gleich sein
                              passwortController.text) {
                            return "Passwort stimmt nicht überein";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          border: UnderlineInputBorder(),
                          labelText: 'Passwort bestätigen',
                        )),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 30),
                  ElevatedButton(
                    child: const Text("User anlegen"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade600,
                    ),
                    onPressed: () {
                      signUp(emailController.text, passwortController.text);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String passwort) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: passwort)
            .then((value) => {
                  postDetailsToFirestore(),
                }); //user wird erstellt und zur Firestore Datenbank hinzugefügt
      } catch (e) {
        Fluttertoast.showToast(msg: "Email bereits in Verwendung");
      }
    }
  }

  postDetailsToFirestore() async {
    //firestore datenbank wird aufgerufen, model wird aufgerufen, werte werden gesendet
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    //alle werte werden geschrieben
    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users") //collection erstellt
        .doc(user.uid) //geht zu diesem dokument
        .set(userModel.toMap()); //werte werden gesetzt
    Fluttertoast.showToast(msg: "Account erfolgreich erstellt");

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}
