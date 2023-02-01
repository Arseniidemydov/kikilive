// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future getDate(DocumentReference? dr) async {
  List date = [];
  List date2 = [];
  await FirebaseFirestore.instance
      .collection("orderList")
      .where("shop_Ref", isEqualTo: dr!)
      .get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      DateTime t = value.docs.elementAt(i).get("order_date").toDate();
      String s = t.year.toString() + t.month.toString() + t.day.toString();
      if (!date2.contains(s)) {
        date.add(t.toString());
        date2.add(s);
      }
    }
  }).whenComplete(() {
    return date;
  });
}
