// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future verifyAddress(DocumentReference? dr) async {
  await FirebaseFirestore.instance
      .collection("address")
      .where("userInfo", isEqualTo: dr)
      .get()
      .then((value) {
    if (value.docs.length > 0) {
      FFAppState().isAddress = true;
      //return true;
    } else {
      FFAppState().isAddress = false;
      //return false;
    }
  });
}
