import 'package:flutter/material.dart';

class ausgabe extends StatelessWidget {
  final Map data;
  ausgabe({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(data["url"]), Text(data["passwort"])],
    );
  }
}
