import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions? get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        apiKey: 'AIzaSyBEJN6e5RcLX71tPaMESeyHh1Ug-tJAwKY',
        authDomain: 'passwortmanagert.firebaseapp.com',
        databaseURL: 'https://passwortmanagert.firebaseio.com',
        projectId: 'passwortmanagert',
        storageBucket: 'passwortmanager.appspot.com',
        messagingSenderId: '637092316671',
        appId: '1:637092316671:android:2c7f9ace888360114b13ca',
      );
    } else {
      // Android
      log("Analytics Dart-only initializer doesn't work on Android, please make sure to add the config file.");

      return null;
    }
  }
}
