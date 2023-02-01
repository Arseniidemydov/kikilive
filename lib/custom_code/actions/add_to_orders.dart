// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addToOrders(
  String? sku,
  String? uid,
  String? orderNo,
  String? transactionid,
  double? finalTotal,
) async {
  // Add your function code here!
  List name = [];
  FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("orderCompleted")
      .get()
      .then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      // if(!name.contains(value.docs.elementAt(i).get("shopName"))){
      //   name.add(value.docs.elementAt(i).get("shopName"));
      // }

      FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("orderCompleted")
          .add({
        "order_date": DateTime.now(),
        "order_number": value.docs.elementAt(i).get("order_number"),
        "transaction_id": transactionid ?? "",
        "status": "shipping pending",
        "product_name": value.docs.elementAt(i).get("productName"),
        "product_qty": value.docs.elementAt(i).get("productQuantity"),
        "product_price": value.docs.elementAt(i).get("productPrice"),
        "product_subtotal": value.docs.elementAt(i).get("subtotal"),
        "shop_name": value.docs.elementAt(i).get("shopName"),
        "sub_order": name.length.toString(),
        "product_image": value.docs.elementAt(i).get("productImage"),
        "final_total": finalTotal ?? 0,
      });
    }
  });
}
