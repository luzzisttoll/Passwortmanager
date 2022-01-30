import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pwm/register.dart';
import 'package:pwm/pwm.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passwortmanager',
      theme: ThemeData.dark(),
      home: const Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final passwortController = TextEditingController();
    final emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Melden Sie sich an",
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
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    controller: passwortController,
                    obscureText: true,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
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
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  child: const Text("Anmelden"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwortController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PWM()),
                    );
                  },
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  child: const Text("Registrieren"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Auth()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
