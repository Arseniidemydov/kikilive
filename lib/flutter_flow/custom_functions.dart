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

int? orderNumOnly(int? pastOrder) {
  // Add your function code here!

  int? newOrder;
  newOrder = pastOrder! + 1;
  return newOrder;
}

int? updateSKU(int? oldSKU) {
  // Add your function code here!
  int? newSKU;
  newSKU = oldSKU! + 1;
  return newSKU;
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

double? calcLiveViewersChannel(
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
  List<OrderRecord> data,
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
        .orderProductPrice!; // Todo: replace "pontos_totais" with the field you want to do a running total on
  }

  return total;
}

double? calcPoints(double orderTotal) {
  return orderTotal * 0.0001;
}

double? calcNetProfit(
  double earnings,
  double payoutAmount,
) {
  return earnings - payoutAmount;
}

double? calcSatoshi(String satoshiprice) {
  double pricefinal = double.parse(satoshiprice);
  double pricefinal2 = pricefinal / 1000000;
  return pricefinal2;
}
