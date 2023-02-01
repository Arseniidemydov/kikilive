// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future clearAddressChecked() async {
  // Add your function code here!
  // Add your function code here!
  await FirebaseFirestore.instance
      .collection("address")
      .get()
      .then((value) async {
    if (value.docs.length > 0) {
      for (int i = 0; i < value.docs.length; i++) {
        value.docs.elementAt(i).reference.update({
          "default_address": false,
        });
      }
    }
  });
}
