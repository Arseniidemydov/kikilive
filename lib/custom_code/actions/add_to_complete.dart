// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addToComplete(
  String? sku,
  String? uid,
  String? orderNo,
  String? transactionid,
  double? finalTotal,
) async {
  // Add your function code here!
  List name = [];
  await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("userOrder")
      .get()
      .then((value) async {
    for (int i = 0; i < value.docs.length; i++) {
      if (!name.contains(value.docs.elementAt(i).get("shopName"))) {
        name.add(value.docs.elementAt(i).get("shopName"));
      }

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("orderCompleted")
          .add({
        "order_date": DateTime.now(),
        "date": DateTime.now().month.toString().padLeft(2, "0") +
            "/" +
            DateTime.now().day.toString().padLeft(2, "0") +
            "/" +
            DateTime.now().year.toString(),
        "order_number": value.docs.elementAt(i).get("order_number"),
        "transaction_id": transactionid ?? "",
        "order_status": "Processing",
        "product_name": value.docs.elementAt(i).get("productName"),
        "product_qty": value.docs.elementAt(i).get("productQuantity"),
        "product_price": value.docs.elementAt(i).get("productPrice"),
        "product_subtotal": value.docs.elementAt(i).get("subtotal"),
        "shop_name": value.docs.elementAt(i).get("shopName"),
        "shop_ref": value.docs.elementAt(i).get("shop_ref"),
        "sub_order": name.length.toString(),
        "product_image": value.docs.elementAt(i).get("productImage"),
        "final_total": finalTotal ?? 0,
      });

      DocumentReference dr =
          FirebaseFirestore.instance.collection("users").doc(uid);
      await FirebaseFirestore.instance.collection("orders").add({
        "order_date": DateTime.now(),
        "date": DateTime.now().month.toString().padLeft(2, "0") +
            "/" +
            DateTime.now().day.toString().padLeft(2, "0") +
            "/" +
            DateTime.now().year.toString(),
        "order_number": value.docs.elementAt(i).get("order_number"),
        "transaction_id": transactionid ?? "",
        "order_status": "Processing",
        "product_name": value.docs.elementAt(i).get("productName"),
        "product_qty": value.docs.elementAt(i).get("productQuantity"),
        "product_price": value.docs.elementAt(i).get("productPrice"),
        "product_subtotal": value.docs.elementAt(i).get("subtotal"),
        "shop_name": value.docs.elementAt(i).get("shopName"),
        "shop_ref": value.docs.elementAt(i).get("shop_ref"),
        "sub_order": name.length.toString(),
        "product_image": value.docs.elementAt(i).get("productImage"),
        "final_total": finalTotal ?? 0,
        "uid": uid,
        "user_ref": dr,
      });
    }
  });
}
