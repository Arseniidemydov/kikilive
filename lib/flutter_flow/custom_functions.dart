import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double? subtotal(List<double>? itemList) {
  // Add your function code here!
  double total = 0;
  for (double add in itemList!) {
    total = total + add;
  }
  return total;
}

int? itemTotal(
  int? quantity,
  double? price,
) {
  // Add your function code here!
  double itemTotal;
  itemTotal = quantity!.toDouble() * price!;
  return itemTotal.toInt();
}

double? minusclick(
  double? subTotal,
  double? price,
) {
  // Add your function code here!
  if (subTotal! > 0) {
    subTotal = subTotal - price!;
  }
  return subTotal;
}

double? plusClick(
  double? subtotal,
  double? price,
) {
  // Add your function code here!
  subtotal = subtotal! + price!;
  return subtotal;
}

String? generateOrderId(int? orderNumber) {
  // Add your function code here!

  int? newOrderNo;
  String? finalOrderVal;

  DateTime date = DateTime.now();
  newOrderNo = orderNumber! + 1;
  //finalOrderVal = newOrderNo.toString() + '-' + date.toString();
  //finalOrderVal = finalOrderVal.substring(0, 12);
  return newOrderNo.toString();
}

bool? clearAddressCheckboxCopy(List<bool>? addressList) {
  // Add your function code here
  bool? addressChecked;
  for (addressChecked in addressList!) {
    addressChecked == false;
  }
  return true;
}

int? finalTotal(
  List<double>? subTotal,
  double? tax,
  List<double>? shipping,
) {
  // Add your function code here!

  double total = 0;
  for (double add in subTotal!) {
    total += add;
  }
  double shipTotal = 0;
  for (double add in shipping!) {
    shipTotal += add;
  }
  double finaltotal = 0.0;
  finaltotal = total + tax! + shipTotal;
  return finaltotal.toInt();
}

int? orderNumOnly(int? pastOrder) {
  // Add your function code here!

  int? newOrder;
  newOrder = pastOrder! + 1;
  return newOrder;
}

int? stripePayAmount(
  List<double>? subTotal,
  double? tax,
  List<double>? shipping,
) {
  // Add your function code here!
  double total = 0;
  for (double add in subTotal!) {
    total += add;
  }
  double shipTotal = 0;
  for (double add in shipping!) {
    shipTotal += add;
  }
  double finaltotal = 0.0;
  finaltotal = total + tax! + shipTotal;
  finaltotal = finaltotal * 100;
  String? stripeTotal = finaltotal.toStringAsFixed(0);
  return int.parse(stripeTotal);
}

bool? validateCart(
  String? sku,
  List<String>? userOrder,
) {
  // Add your function code here!
  if (userOrder!.isNotEmpty) {
    for (String? cartItem in userOrder) {
      if (sku == cartItem) {
        return true;
      }
    }
    return false;
  }
}

String? generateSKU(int? newValue) {
  // Add your function code here!

  int? newSKU;

  newSKU = newValue! + 1;
  String? finalSKU = newSKU.toString();
  return finalSKU = 'SKU-' + finalSKU;
}

int? updateSKU(int? oldSKU) {
  // Add your function code here!
  int? newSKU;
  newSKU = oldSKU! + 1;
  return newSKU;
}

int? countCartItems(List<int>? cartList) {
  // Add your function code here!
  int count = 0;
  for (int? add in cartList!) {
    count += add!;
  }
  return count;
}

double? calcTax(
  double? taxValue,
  List<double>? taxableAmount,
) {
  // Add your function code here!
  double tax = 0;
  double? taxAmount;

  for (double add in taxableAmount!) {
    tax += add;
  }
  taxAmount = tax * taxValue! / 100;
  return taxAmount;
}

double? calcEarning(
  DateTime? today,
  List<double>? totalEarning,
  List<DateTime>? earningDate,
) {
  // Add your function code here!
  double earning = 0.0;
  String sd = today!.month.toString().padLeft(2, "0") +
      today.day.toString().padLeft(2, "0") +
      today.year.toString();

  for (int i = 0; i < earningDate!.length; i++) {
    DateTime cd = earningDate[i];
    String s = cd.month.toString().padLeft(2, "0") +
        cd.day.toString().padLeft(2, "0") +
        cd.year.toString();

    if (s == sd) {
      earning = earning + totalEarning![i];
    }
  }

  return earning;
}

double? calcDeposit(
  DateTime? today,
  List<double>? totalDeposit,
  List<DateTime>? depositDate,
) {
  // Add your function code here!
  double deposit = 0.0;
  String sd = today!.month.toString().padLeft(2, "0") +
      today.day.toString().padLeft(2, "0") +
      today.year.toString();
  if (depositDate!.length > 0) {
    for (int i = 0; i < depositDate!.length; i++) {
      DateTime cd = depositDate[i];
      String s = cd.month.toString().padLeft(2, "0") +
          cd.day.toString().padLeft(2, "0") +
          cd.year.toString();

      if (s == sd) {
        deposit = deposit + totalDeposit![i];
      }
    }
    return deposit;
  } else {
    return deposit;
  }
}

bool? isNewSellerListEmpty(List<NewSellerRequestRecord>? newSellerList) {
  // Add your function code here!
  if (newSellerList!.isNotEmpty) {
    return true;
  }
  return false;
}

bool? clearAddressCheckbox(List<bool>? addressList) {
  // Add your function code here
  bool? addressChecked;
  for (addressChecked in addressList!) {
    addressChecked == false;
  }
  return true;
}

bool? clearChecked(DocumentReference? docRef) {
  FirebaseFirestore.instance
      .collection("address")
      .where("userInfo", isEqualTo: docRef)
      .get()
      .then((value) {
    for (int? i = 0; i! < value.docs.length; i++) {
      value.docs.elementAt(i).reference.update({
        "default_address": false,
      });
    }
  });
  return true;
}

String? searchInShop(DocumentReference? orderReference) {
  // Add your function code here!
  double d = 0;
  FirebaseFirestore.instance
      .collection("orders")
      .where("user_ref", isEqualTo: orderReference)
      .get()
      .then((value) async {
    if (value.docs.length > 0) {
      for (int i = 0; i < value.docs.length; i++) {
        d = d + value.docs.elementAt(i).get("final_total").toDouble();
      }
    }
  });
  return d.toString();
}

double? shopNetEarning(
  List<double>? shopEarning,
  List<double>? totalDeposits,
) {
  // Add your function code here!
  double earningTotal = 0;
  for (double add in shopEarning!) {
    earningTotal += add;
  }
  double subTotal = 0;
  for (double add in totalDeposits!) {
    subTotal += add;
  }

  double? shopNetEarning = earningTotal - subTotal;
  return shopNetEarning;
}

String? getUserId(DocumentReference? userReference) {
  // Add your function code here!
  return userReference!.id.toString();
}

List<String> getEarningDate(List<DateTime> orderDateList) {
  // Add your function code here!
  List<String> date = [];
  List date2 = [];
  for (int i = 0; i < orderDateList.length; i++) {
    DateTime t = orderDateList[i];
    String s = t.month.toString() + t.day.toString() + t.year.toString();
    if (!date2.contains(s)) {
      date.add(t.month.toString().padLeft(2, "0") +
          "/" +
          t.day.toString().padLeft(2, "0") +
          "/" +
          t.year.toString());
      date2.add(s);
    }
  }
  return date;
}

String? dateConvert(String? dateString) {
  // Add your function code here!
  return dateString!.substring(0, 10);
}

List<String>? getEarningDetails(
  DocumentReference? dr,
  DateTime? datetime,
) {
  // Add your function code here!
  List<String> n = [];
  String s = datetime!.month.toString() +
      "/" +
      datetime.day.toString().padLeft(2, "0") +
      "/" +
      datetime.year.toString().padLeft(2, "0");
  FirebaseFirestore.instance.collection("orders").where("shop_ref")
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

String? getPlaybackIdFromUrl(String? url) {
  // Add your function code here!
  String? str1 = url!.replaceAll(".m3u8", "");
  return str1.split("/").last;
}

String? createUrlFromPlayId(String? playbackId) {
  // Add your function code here!
  return 'https://stream.mux.com/$playbackId.m3u8';
}

double? stripeAmountPayNewCart(
  double shipping,
  double amount,
) {
  return (shipping + amount) * 100;
}

double? calcLiveViewrsChannel(
  List<StreamsRecord> data,
  int? index,
  int count,
) {
  var maxIndex = index;
  if (maxIndex == -1 || index! >= data.length) {
    // Pass index of -1 if you want a grand total across all indexes
    maxIndex = data.length - 1;
  }

  double total = 0;
  for (var i = 0; i <= maxIndex!; i++) {
    total += data[i]
        .streamViewOnline!; // Todo: replace "pontos_totais" with the field you want to do a running total on
  }

  return total;
}

bool checkPaymentStatus(String paymentID) {
  if (paymentID != "") {
    return true;
  } else {
    return false;
  }
}

int? orderNoCalculateNew(int numberOfOrders) {
  return numberOfOrders + 1;
}

double? stripeAmountPayNew(
  double shipping,
  double amount,
) {
  return shipping + amount;
}

double? sumEarnings(
  List<OrdersRecord> data,
  int? index,
) {
  var maxIndex = index;
  if (maxIndex == -1 || index! >= data.length) {
    // Pass index of -1 if you want a grand total across all indexes
    maxIndex = data.length - 1;
  }

  double total = 0;
  for (var i = 0; i <= maxIndex!; i++) {
    total += data[i]
        .productPrice!; // Todo: replace "pontos_totais" with the field you want to do a running total on
  }

  return total;
}

double? pointsCalulator(double orderTotal) {
  return orderTotal * 0.0001;
}
