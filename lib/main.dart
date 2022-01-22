import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pwm/register.dart';
import 'package:pwm/pwm.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GlobalKey<FormState> FormKey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwortController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;

bool _success = Null as bool;
String userEmail = "";

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
                  const Text(
                      "Melden Sie sich an",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, height: 5)
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 16),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Benutzername',
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 16),
                    child: TextFormField(
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
                ElevatedButton(
                    child: const Text("Anmelden"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    onPressed: () {
                      _navigateToPwm(context);
                    },
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  child: const Text("Registrieren"),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  ),
                  onPressed: () {
                    _navigateToRegister(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
    void _navigateToRegister(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Register()));
  }
    void _navigateToPwm(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PWM()));
  }
}