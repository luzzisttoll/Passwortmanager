import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Eingabe extends StatefulWidget {
  const Eingabe({Key? key}) : super(key: key);

  @override
  _EingabeState createState() => _EingabeState();
}

class _EingabeState extends State<Eingabe> {
  final passwort = TextEditingController();
  final url = TextEditingController();
  bool showPwd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Eingabe'),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Hero(
                  tag: 'formular',
                  child: Text(
                    "Geben Sie die URL und das Passwort der Seite ein:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        height: 5,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    controller: passwort,
                    obscureText: showPwd,
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
                    onSaved: (value) {
                      passwort.text = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.vpn_key),
                      border: const UnderlineInputBorder(),
                      labelText: 'Passwort',
                      suffixIcon: IconButton(
                        icon: Icon(showPwd
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill),
                        onPressed: _show,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    controller: url,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.globe),
                      border: UnderlineInputBorder(),
                      labelText: 'URL / Websitename',
                    ),
                  ),
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
                      onPressed: null,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _show() {
    setState(() {
      showPwd = !showPwd;
    });
  }
}
