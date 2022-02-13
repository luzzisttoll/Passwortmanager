import 'package:flutter/material.dart';
import 'package:pwm/pages/homescreen.dart';
import 'package:pwm/pages/passwoerter.dart';

class Pwm extends StatefulWidget {
  const Pwm({Key? key}) : super(key: key);

  @override
  _PwmState createState() => _PwmState();
}

class _PwmState extends State<Pwm> {
  int currentIndex = 0;

  final screens = [
    const Home(),
    const Passwoerter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Passwortmanager')),
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
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red.shade600),
          const BottomNavigationBarItem(
              icon: Icon(Icons.vpn_key),
              label: 'Passwörter',
              backgroundColor: Colors.redAccent),
        ],
      ),
    );
  }
}
