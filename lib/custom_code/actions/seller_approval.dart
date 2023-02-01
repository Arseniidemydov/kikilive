// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future sellerApproval(DocumentReference? sellerRef) async {
  // Add your function code here!

  //String? sellerId = sellerRef.toString();
  // List<String>? seller_uid = sellerId.split("/");

  await FirebaseFirestore.instance.doc(sellerRef!.path).update({
    "Is_approved": true,
    "status": "Approved",
  });
}
