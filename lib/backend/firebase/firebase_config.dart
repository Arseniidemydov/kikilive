import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBZmLYGXEpNNGHkpxcm2mI7zGAucpwqP54",
            authDomain: "bryan-155ca.firebaseapp.com",
            projectId: "bryan-155ca",
            storageBucket: "bryan-155ca.appspot.com",
            messagingSenderId: "279495486865",
            appId: "1:279495486865:web:17a789e6d4da74dc293e30",
            measurementId: "G-BJWYCL1LCC"));
  } else {
    await Firebase.initializeApp();
  }
}
