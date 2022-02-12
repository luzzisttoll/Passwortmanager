// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:pwm/pages/homescreen.dart';
import 'package:pwm/pages/passw%C3%B6rter.dart';

class pwm extends StatefulWidget {
  const pwm({Key? key}) : super(key: key);

  @override
  _pwmState createState() => _pwmState();
}

class _pwmState extends State<pwm> {
  int currentIndex = 0;

  final screens = [
    const home(),
    const passwoerter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passwortmanager')),
      body: IndexedStack(
        //wird die seite gewechselt, bleiben die seiten unverändert
        index: currentIndex, //welche seite angezeicht wird
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting, //animation
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex =
              index), //durch klicken auf icon wird screen gewechselt
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.redAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.vpn_key),
                label: 'Passwörter',
                backgroundColor: Colors.deepOrangeAccent),
          ]),
    );
  }
}
