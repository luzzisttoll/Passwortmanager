import 'package:flutter/material.dart';

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Registrieren')
        ),
     body: Center(
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
                const SizedBox(width: 30),
                ElevatedButton(
                  child: const Text("Registrieren"),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  ),
                  onPressed: () {
                   null;
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