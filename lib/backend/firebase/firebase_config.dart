import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA1FMpExbB8wy3SEFWYrpGiwFkDOeeoZK0",
            authDomain: "asistenciaqr-sy01we.firebaseapp.com",
            projectId: "asistenciaqr-sy01we",
            storageBucket: "asistenciaqr-sy01we.appspot.com",
            messagingSenderId: "787470282724",
            appId: "1:787470282724:web:435e262b063383b98061f1"));
  } else {
    await Firebase.initializeApp();
  }
}
