// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

Future sendEmail() async {
  // Add your function code here!
  late Timer time;
  User user = FirebaseAuth.instance.currentUser!;
  user.sendEmailVerification();
  // print("email send");

  time = Timer.periodic(Duration(seconds: 2), (timer) async {
    User user = FirebaseAuth.instance.currentUser!;
    user.reload();
    if (user.emailVerified == true) {
      print("verify");
      time.cancel();
    } else {
      print("not verify");
    }
  });
}
