// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addToCart(
  String? sku,
  String? uid,
  double? shipping,
  double? tax,
  String? orderNo,
) async {
  // Add your function code here!
  FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("userOrder")
      .where("sku", isEqualTo: sku)
      .get()
      .then((value) {
    if (value.docs.length > 0) {
      int p = value.docs.elementAt(0).get("productQuantity");
      var v = value.docs.elementAt(0).get("productPrice");
      p++;
      double s = (p * v).toDouble();
      value.docs.elementAt(0).reference.update({
        "productQuantity": p,
        "subtotal": s,
      });
    } else {
      FirebaseFirestore.instance
          .collection("products")
          .where("sku", isEqualTo: sku)
          .get()
          .then((value) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .collection("userOrder")
            .add({
          "shopName": value.docs.elementAt(0).get("shop_name"),
          "productName": value.docs.elementAt(0).get("product_name"),
          "productPrice": value.docs.elementAt(0).get("product_price"),
          "productQuantity": 1,
          "subtotal": value.docs.elementAt(0).get("product_price"),
          "timestamp": DateTime.now(),
          "productImage": value.docs.elementAt(0).get("product_photo"),
          "order_number": orderNo ?? "0",
          "tax": tax ?? 0,
          "shipping": shipping ?? 0,
          "finalTotal": 0,
          "sub_order": 1,
          "sku": value.docs.elementAt(0).get("sku"),
          "shop_ref": value.docs.elementAt(0).get("user_ref"),
        });
      });
    }
  });
}
