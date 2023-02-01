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
import 'package:flutter/material.dart';

class OrderMgmtAdmin extends StatefulWidget {
  final double? height;
  final double? width;
  const OrderMgmtAdmin({Key? key, this.height, this.width}) : super(key: key);

  @override
  State<OrderMgmtAdmin> createState() => _OrderMgmtAdminState();
}

class _OrderMgmtAdminState extends State<OrderMgmtAdmin> {
  @override
  void initState() {
    super.initState();
    getOrder();
  }

  List m = [];

  bool show = false;

  getOrder() async {
    List count = [];
    await FirebaseFirestore.instance.collection("orders").get().then((value) {
      if (value.docs.length > 0) {
        print(value.docs.length);
        for (int i = 0; i < value.docs.length; i++) {
          if (!count.contains(value.docs.elementAt(i).get("order_number"))) {
            count.add(value.docs.elementAt(i).get("order_number"));
            m.add([
              value.docs.elementAt(i).get("order_number"),
              value.docs.elementAt(i).get("order_date").toDate(),
              value.docs.elementAt(i).get("final_total"),
              value.docs.elementAt(i).get("shop_name")
            ]);
          }
        }
      }
    });

    show = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: m.length > 0
            ? ListView.builder(
                itemCount: m.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DateTime t = m[index][1];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          FFAppState().orderNo = m[index][0];
                        });
                      },
                      child: Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width,
                        color: FFAppState().orderNo == m[index][0]
                            ? Colors.grey.shade300
                            : Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 110,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Icon(
                                Icons.credit_card,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            Container(
                                height: 110,
                                width:
                                    MediaQuery.of(context).size.width * 0.7 - 8,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Shop Name# ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            m[index][3].toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Date# ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            t.month.toString().padLeft(2, "0") +
                                                "-" +
                                                t.day
                                                    .toString()
                                                    .padLeft(2, "0") +
                                                "-" +
                                                t.year.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Order No# ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            m[index][0].toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Total Amount# ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            m[index][2].toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : show == false
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/bryan-155ca.appspot.com/o/cms_uploads%2Fdefaul_img%2F1668587996546000%2Femptylist.png?alt=media&token=765d923c-9c34-4a93-972a-6bd1a14a316a",
                        height: MediaQuery.of(context).size.width * 0.3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Seems you don't have any Order on your bucket",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
      ),
    );
  }
}
