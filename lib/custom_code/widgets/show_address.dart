// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

class ShowAddress extends StatefulWidget {
  final double? height;
  final double? width;
  final DocumentReference? userInfo;
  final Color? mainColor;
  final Color? secondaryColor;
  const ShowAddress(
      {Key? key,
      this.height,
      this.width,
      this.userInfo,
      this.mainColor,
      this.secondaryColor})
      : super(key: key);

  @override
  State<ShowAddress> createState() => _ShowAddressState();
}

class _ShowAddressState extends State<ShowAddress> {
  @override
  Widget build(BuildContext context) {
    double mediaQH = MediaQuery.of(context).size.height;
    double mediaQW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("address")
            .where("userInfo", isEqualTo: widget.userInfo)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          print(snapshot.data!.docs.length);
          return Container(
            height: mediaQH * 0.8,
            width: mediaQW,
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            child: snapshot.data!.docs.length > 0
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = snapshot.data!.docs
                          .elementAt(index)
                          .data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: mediaQH * 0.12,
                          width: mediaQW * 0.9,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Set Default Address",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.65),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.docs
                                              .elementAt(index)
                                              .get("addressLabel"),
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.55),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          snapshot.data!.docs
                                              .elementAt(index)
                                              .get("address"),
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.55),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    for (int i = 0;
                                        i < snapshot.data!.docs.length;
                                        i++) {
                                      if (i != index) {
                                        snapshot.data!.docs
                                            .elementAt(i)
                                            .reference
                                            .update({
                                          "default_address": false,
                                        });
                                      } else {
                                        snapshot.data!.docs
                                            .elementAt(i)
                                            .reference
                                            .update({
                                          "default_address": true,
                                        });
                                      }
                                    }
                                    setState(() {});
                                  },
                                  icon: data.containsKey("default_address") &&
                                          snapshot.data!.docs
                                                  .elementAt(index)
                                                  .get("default_address") ==
                                              true
                                      ? Icon(
                                          Icons.check_box_rounded,
                                          color: widget.mainColor ?? Colors.red,
                                        )
                                      : Icon(Icons.square_outlined,
                                          color:
                                              widget.mainColor ?? Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/bryan-155ca.appspot.com/o/cms_uploads%2Fdefaul_img%2F1668587996546000%2Femptylist.png?alt=media&token=765d923c-9c34-4a93-972a-6bd1a14a316a",
                        height: mediaQW * 0.3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Seems you don't have any address in your list",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
