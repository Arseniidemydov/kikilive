// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future clearCart(
  String? uid,
  DocumentReference? currentUser,
) async {
  // Add your function code here!
  FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('userOrder')
      .get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      value.docs.elementAt(i).reference.delete();
    }
  });
}
