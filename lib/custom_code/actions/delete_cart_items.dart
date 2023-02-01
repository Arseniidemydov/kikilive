// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deleteCartItems(
  String? uid,
  String? sku,
) async {
  // Add your function code here!
  // Add your function code here!
  FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('userOrder')
      .where("sku", isEqualTo: sku)
      .get()
      .then((value) {
    value.docs.elementAt(0).reference.delete();
  });
}
