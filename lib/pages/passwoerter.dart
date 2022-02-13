import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Passwoerter extends StatefulWidget {
  const Passwoerter({Key? key}) : super(key: key);

  @override
  _PasswoerterState createState() => _PasswoerterState();
}

class _PasswoerterState extends State<Passwoerter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ihre Passwörter',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(highlightColor: Colors.red.shade600),
              child: FloatingActionButton(
                onPressed: () => Fluttertoast.showToast(msg: "hs"),
                backgroundColor: Colors.redAccent,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
