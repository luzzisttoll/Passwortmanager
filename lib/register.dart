import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwortController = TextEditingController();
    final confirmpasswortController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Registrieren')),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("Registrieren Sie sich.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, height: 5)),
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

                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        border: UnderlineInputBorder(),
                        labelText: 'Passwort bestätigen',
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 30),
                ElevatedButton(
                  child: const Text("User anlegen"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwortController.text);
                    setState(() {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
