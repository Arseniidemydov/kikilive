import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_details_preview_model.dart';
export 'order_details_preview_model.dart';

class OrderDetailsPreviewWidget extends StatefulWidget {
  const OrderDetailsPreviewWidget({
    Key? key,
    this.orderNo,
    this.shopRef,
    this.userRef,
    this.addressRef,
    this.orderList,
  }) : super(key: key);

  final String? orderNo;
  final DocumentReference? shopRef;
  final DocumentReference? userRef;
  final DocumentReference? addressRef;
  final DocumentReference? orderList;

  @override
  _OrderDetailsPreviewWidgetState createState() =>
      _OrderDetailsPreviewWidgetState();
}

class _OrderDetailsPreviewWidgetState extends State<OrderDetailsPreviewWidget> {
  late OrderDetailsPreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderDetailsPreviewModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<OrderListRecord>(
      stream: OrderListRecord.getDocument(widget.orderList!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final orderDetailsPreviewOrderListRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  title: Text(
                    'Order Details',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 10, 16, 10),
                                child: StreamBuilder<UsersRecord>(
                                  stream:
                                      UsersRecord.getDocument(widget.userRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnUsersRecord = snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Customer',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                        ),
                                              ),
                                              Text(
                                                columnUsersRecord.displayName!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Phone',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              SelectionArea(
                                                  child: Text(
                                                columnUsersRecord.phoneNumber!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              )),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          color: Color(0xFF938F99),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 10),
                                child: StreamBuilder<AddressRecord>(
                                  stream: AddressRecord.getDocument(
                                      orderDetailsPreviewOrderListRecord
                                          .addressRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnAddressRecord = snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Address',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                        ),
                                              ),
                                              Text(
                                                columnAddressRecord
                                                    .addressLabel!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                columnAddressRecord.address!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                ', ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                columnAddressRecord.address2!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                ', ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                columnAddressRecord.city!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                columnAddressRecord.zipcode!
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF938F99),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: StreamBuilder<List<OrdersRecord>>(
                                stream: queryOrdersRecord(
                                  queryBuilder: (ordersRecord) => ordersRecord
                                      .where('order_number',
                                          isEqualTo:
                                              orderDetailsPreviewOrderListRecord
                                                  .orderNo)
                                      .where('shop_ref',
                                          isEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<OrdersRecord> listViewOrdersRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewOrdersRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewOrdersRecord =
                                          listViewOrdersRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      listViewOrdersRecord
                                                                          .orderDate!
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            () {
                                                                              if (listViewOrdersRecord.orderStatus == 'Processing') {
                                                                                return Color(0xFFFF9F46);
                                                                              } else if (listViewOrdersRecord.orderStatus == 'Complete') {
                                                                                return Color(0xFF39BF67);
                                                                              } else if (listViewOrdersRecord.orderStatus == 'Cancel') {
                                                                                return FlutterFlowTheme.of(context).customColor3;
                                                                              } else if (listViewOrdersRecord.orderStatus == 'Refunded') {
                                                                                return FlutterFlowTheme.of(context).icons;
                                                                              } else if (listViewOrdersRecord.orderStatus == 'Shipping') {
                                                                                return Color(0xFFFF9F46);
                                                                              } else {
                                                                                return Color(0xFFF2B8B5);
                                                                              }
                                                                            }(),
                                                                            Color(0xFFF2B8B5),
                                                                          ),
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              listViewOrdersRecord.orderStatus!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: valueOrDefault<Color>(
                                                                                      () {
                                                                                        if (listViewOrdersRecord.orderStatus == 'Processing') {
                                                                                          return Color(0xFFFF9F46);
                                                                                        } else if (listViewOrdersRecord.orderStatus == 'Complete') {
                                                                                          return Color(0xFF39BF67);
                                                                                        } else if (listViewOrdersRecord.orderStatus == 'Cancel') {
                                                                                          return FlutterFlowTheme.of(context).customColor3;
                                                                                        } else if (listViewOrdersRecord.orderStatus == 'Refunded') {
                                                                                          return FlutterFlowTheme.of(context).icons;
                                                                                        } else if (listViewOrdersRecord.orderStatus == 'Shipping') {
                                                                                          return Color(0xFFFF9F46);
                                                                                        } else {
                                                                                          return Color(0xFFF2B8B5);
                                                                                        }
                                                                                      }(),
                                                                                      Color(0xFFF2B8B5),
                                                                                    ),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (FFAppState()
                                                                        .isOrderOpen !=
                                                                    listViewOrdersRecord
                                                                        .reference)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().isOrderOpen =
                                                                            listViewOrdersRecord.reference;
                                                                      });
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_up,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .isOrderOpen ==
                                                                    listViewOrdersRecord
                                                                        .reference)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().isOrderOpen =
                                                                            null;
                                                                      });
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 16, 0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    child: Image
                                                                        .network(
                                                                      listViewOrdersRecord
                                                                          .productImage!,
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    height: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                SelectionArea(
                                                                                    child: Text(
                                                                                  listViewOrdersRecord.productName!,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                )),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                SelectionArea(
                                                                                    child: Text(
                                                                                  '1 x ',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: Color(0xFF938F99),
                                                                                      ),
                                                                                )),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                  child: Text(
                                                                                    listViewOrdersRecord.productPrice!.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: Color(0xFF938F99),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (FFAppState()
                                                                    .isOrderOpen ==
                                                                listViewOrdersRecord
                                                                    .reference)
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                    color: Color(
                                                                        0xA595A1AC),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Order No.',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFF938F99),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          listViewOrdersRecord
                                                                              .orderNumber!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            5),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          'Transaction ID#',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFF938F99),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        )),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            orderDetailsPreviewOrderListRecord.paymentID!,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    height: 10,
                                                                    thickness:
                                                                        1,
                                                                    color: Color(
                                                                        0xFF938F99),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Shop Name',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFF938F99),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream:
                                                                              UsersRecord.getDocument(listViewOrdersRecord.shopRef!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            final textUsersRecord =
                                                                                snapshot.data!;
                                                                            return SelectionArea(
                                                                                child: Text(
                                                                              textUsersRecord.displayName!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                            ));
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Price',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFF938F99),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          formatNumber(
                                                                            listViewOrdersRecord.productPrice!,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.automatic,
                                                                            currency:
                                                                                'THB ',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                    color: Color(
                                                                        0xFF938F99),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'Shipping Number',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Color(0xFF938F99),
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          listViewOrdersRecord
                                                                              .shippingNo!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'Shipping Company',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Color(0xFF938F99),
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          listViewOrdersRecord
                                                                              .shippingCompany!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                    color: Color(
                                                                        0xA595A1AC),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (listViewOrdersRecord
                                                                    .orderStatus !=
                                                                'Complete')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (listViewOrdersRecord
                                                                            .orderStatus !=
                                                                        'Cancel')
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              20),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'orderDetailsEdit',
                                                                                queryParams: {
                                                                                  'orderReference': serializeParam(
                                                                                    listViewOrdersRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            text:
                                                                                'Update  Order',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 140,
                                                                              height: 40,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(30),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
