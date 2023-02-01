// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future getEarnings(DocumentReference? dr, DateTime? earningDt) async {
  List<String> n = [];
  String s = earningDt!.month.toString() +
      "/" +
      earningDt.day.toString().padLeft(2, "0") +
      "/" +
      earningDt.year.toString().padLeft(2, "0");
  await FirebaseFirestore.instance.collection("orders").where("shop_ref")
    ..get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        DateTime dt = value.docs.elementAt(i).get("order_date").toDate();
        String ds = dt.month.toString() +
            "/" +
            dt.day.toString().padLeft(2, "0") +
            "/" +
            dt.year.toString().padLeft(2, "0");
        if (s == ds) {
          n.add(value.docs.elementAt(i).reference.id);
        }
      }
    });
  return n;
}
