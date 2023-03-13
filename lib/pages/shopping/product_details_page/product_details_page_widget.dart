import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_details_page_model.dart';
export 'product_details_page_model.dart';

class ProductDetailsPageWidget extends StatefulWidget {
  const ProductDetailsPageWidget({
    Key? key,
    this.productDetails,
  }) : super(key: key);

  final DocumentReference? productDetails;

  @override
  _ProductDetailsPageWidgetState createState() =>
      _ProductDetailsPageWidgetState();
}

class _ProductDetailsPageWidgetState extends State<ProductDetailsPageWidget> {
  late ProductDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ProductsRecord>(
      stream: ProductsRecord.getDocument(widget.productDetails!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 25.0,
              height: 25.0,
              child: SpinKitDoubleBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 25.0,
              ),
            ),
          );
        }
        final productDetailsPageProductsRecord = snapshot.data!;
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
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  title: Text(
                    'Product Details',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20.0,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 2.0,
                )
              : null,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBFE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Hero(
                                          tag: productDetailsPageProductsRecord
                                              .productPhoto!,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Image.network(
                                              productDetailsPageProductsRecord
                                                  .productPhoto!,
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.45,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Hero(
                                        tag: productDetailsPageProductsRecord
                                            .productPhoto!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            productDetailsPageProductsRecord
                                                .productPhoto!,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.45,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 15.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        productDetailsPageProductsRecord
                                            .productSubCategory!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Text(
                                    productDetailsPageProductsRecord
                                        .productName!,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 5.0, 0.0, 10.0),
                                      child: Text(
                                        productDetailsPageProductsRecord
                                            .productPrice!
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 5.0, 0.0, 10.0),
                                      child: Text(
                                        'THB',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 5.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                productDetailsPageProductsRecord
                                                    .productSellerReference!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    child: SpinKitDoubleBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'user_profile_view',
                                                    queryParams: {
                                                      'userRef': serializeParam(
                                                        productDetailsPageProductsRecord
                                                            .productSellerReference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .brandBg,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Container(
                                                            width: 270.0,
                                                            height: 90.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .brandBg,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: 60.0,
                                                                    height:
                                                                        60.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      containerUsersRecord
                                                                          .photoUrl!,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  containerUsersRecord
                                                                      .displayName!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Container(
                                                            width: 50.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .brandBg,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .button,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 10.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Descriptions',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 15.0),
                                  child: Text(
                                    productDetailsPageProductsRecord
                                        .productDesc!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<List<OrderListRecord>>(
                        stream: queryOrderListRecord(
                          queryBuilder: (orderListRecord) => orderListRecord
                              .where('order_list_is_paid', isEqualTo: false)
                              .where('order_list_user_reference',
                                  isEqualTo: currentUserReference),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: SpinKitDoubleBounce(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 25.0,
                                ),
                              ),
                            );
                          }
                          List<OrderListRecord> fullWidthBGOrderListRecordList =
                              snapshot.data!;
                          final fullWidthBGOrderListRecord =
                              fullWidthBGOrderListRecordList.isNotEmpty
                                  ? fullWidthBGOrderListRecordList.first
                                  : null;
                          return Container(
                            width: double.infinity,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).bottomSheet,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x320F1113),
                                  offset: Offset(0.0, -2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 34.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FutureBuilder<int>(
                                      future: queryOrderListRecordCount(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 25.0,
                                              height: 25.0,
                                              child: SpinKitDoubleBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 25.0,
                                              ),
                                            ),
                                          );
                                        }
                                        int containerCount = snapshot.data!;
                                        return Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                StreamBuilder<UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      productDetailsPageProductsRecord
                                                          .productSellerReference!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          child:
                                                              SpinKitDoubleBounce(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerUsersRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (fullWidthBGOrderListRecord !=
                                                              null)
                                                            StreamBuilder<
                                                                List<
                                                                    OrderRecord>>(
                                                              stream:
                                                                  queryOrderRecord(
                                                                queryBuilder: (orderRecord) => orderRecord
                                                                    .where(
                                                                        'order_list_reference',
                                                                        isEqualTo:
                                                                            fullWidthBGOrderListRecord!
                                                                                .reference)
                                                                    .where(
                                                                        'order_product_reference',
                                                                        isEqualTo:
                                                                            productDetailsPageProductsRecord.reference),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          25.0,
                                                                      height:
                                                                          25.0,
                                                                      child:
                                                                          SpinKitDoubleBounce(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<OrderRecord>
                                                                    iconOrderRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final iconOrderRecord =
                                                                    iconOrderRecordList
                                                                            .isNotEmpty
                                                                        ? iconOrderRecordList
                                                                            .first
                                                                        : null;
                                                                return InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (fullWidthBGOrderListRecord!
                                                                            .orderListProductList!
                                                                            .toList()
                                                                            .contains(productDetailsPageProductsRecord.reference) ==
                                                                        true) {
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().ProductListCart = fullWidthBGOrderListRecord!
                                                                            .orderListProductList!
                                                                            .toList();
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .removeFromProductListCart(productDetailsPageProductsRecord.reference);
                                                                      });

                                                                      final orderListUpdateData1 =
                                                                          {
                                                                        'order_list_product_list':
                                                                            FFAppState().ProductListCart,
                                                                        'order_list_total':
                                                                            FieldValue.increment(-(productDetailsPageProductsRecord.productPrice!)),
                                                                        'order_list_seller_reference':
                                                                            FieldValue.arrayRemove([
                                                                          productDetailsPageProductsRecord
                                                                              .productSellerReference
                                                                        ]),
                                                                      };
                                                                      await fullWidthBGOrderListRecord!
                                                                          .reference
                                                                          .update(
                                                                              orderListUpdateData1);

                                                                      final productsUpdateData =
                                                                          {
                                                                        'product_inventory':
                                                                            FieldValue.increment(1),
                                                                      };
                                                                      await widget
                                                                          .productDetails!
                                                                          .update(
                                                                              productsUpdateData);
                                                                      await iconOrderRecord!
                                                                          .reference
                                                                          .delete();
                                                                    } else {
                                                                      final orderListUpdateData2 =
                                                                          {
                                                                        'order_list_product_list_unique':
                                                                            FieldValue.arrayRemove([
                                                                          productDetailsPageProductsRecord
                                                                              .reference
                                                                        ]),
                                                                        'order_list_seller_reference':
                                                                            FieldValue.arrayRemove([
                                                                          productDetailsPageProductsRecord
                                                                              .productSellerReference
                                                                        ]),
                                                                      };
                                                                      await fullWidthBGOrderListRecord!
                                                                          .reference
                                                                          .update(
                                                                              orderListUpdateData2);
                                                                      await iconOrderRecord!
                                                                          .reference
                                                                          .delete();
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove_circle_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    fullWidthBGOrderListRecord !=
                                                            null
                                                        ? valueOrDefault<
                                                            String>(
                                                            fullWidthBGOrderListRecord!
                                                                .orderListProductList!
                                                                .toList()
                                                                .where((e) =>
                                                                    e ==
                                                                    productDetailsPageProductsRecord
                                                                        .reference)
                                                                .toList()
                                                                .length
                                                                .toString(),
                                                            '0',
                                                          )
                                                        : '0',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize: 15.0,
                                                        ),
                                                  ),
                                                ),
                                                StreamBuilder<UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      productDetailsPageProductsRecord
                                                          .productSellerReference!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          child:
                                                              SpinKitDoubleBounce(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final iconUsersRecord =
                                                        snapshot.data!;
                                                    return InkWell(
                                                      onTap: () async {
                                                        if (fullWidthBGOrderListRecord !=
                                                            null) {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .ProductListCart =
                                                                fullWidthBGOrderListRecord!
                                                                    .orderListProductList!
                                                                    .toList();
                                                          });
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState().addToProductListCart(
                                                                productDetailsPageProductsRecord
                                                                    .reference);
                                                          });

                                                          final orderListUpdateData =
                                                              {
                                                            'order_list_product_list':
                                                                FFAppState()
                                                                    .ProductListCart,
                                                            'order_list_total':
                                                                FieldValue.increment(
                                                                    productDetailsPageProductsRecord
                                                                        .productPrice!),
                                                            'order_list_product_list_unique':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              productDetailsPageProductsRecord
                                                                  .reference
                                                            ]),
                                                            'order_list_seller_reference':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              productDetailsPageProductsRecord
                                                                  .productSellerReference
                                                            ]),
                                                          };
                                                          await fullWidthBGOrderListRecord!
                                                              .reference
                                                              .update(
                                                                  orderListUpdateData);

                                                          final orderCreateData1 =
                                                              createOrderRecordData(
                                                            orderDate:
                                                                getCurrentTimestamp,
                                                            orderStatus:
                                                                'Processing',
                                                            orderSellerReference:
                                                                productDetailsPageProductsRecord
                                                                    .productSellerReference,
                                                            orderUserReference:
                                                                currentUserReference,
                                                            orderListReference:
                                                                fullWidthBGOrderListRecord!
                                                                    .reference,
                                                            orderProductReference:
                                                                productDetailsPageProductsRecord
                                                                    .reference,
                                                            orderFromListNumber:
                                                                fullWidthBGOrderListRecord!
                                                                    .orderListNumber,
                                                            orderProductPrice:
                                                                productDetailsPageProductsRecord
                                                                    .productPrice,
                                                          );
                                                          await OrderRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  orderCreateData1);

                                                          final productsUpdateData1 =
                                                              {
                                                            'product_inventory':
                                                                FieldValue
                                                                    .increment(
                                                                        -(1)),
                                                          };
                                                          await productDetailsPageProductsRecord
                                                              .reference
                                                              .update(
                                                                  productsUpdateData1);
                                                        } else {
                                                          final orderListCreateData =
                                                              {
                                                            ...createOrderListRecordData(
                                                              orderListDate:
                                                                  getCurrentTimestamp,
                                                              orderListUserReference:
                                                                  currentUserReference,
                                                              orderListIsPaid:
                                                                  false,
                                                              orderListNumber: functions
                                                                  .orderNoCalculateNew(
                                                                      containerCount),
                                                              orderListTotal:
                                                                  productDetailsPageProductsRecord
                                                                      .productPrice,
                                                              orderListShippingTotal:
                                                                  iconUsersRecord
                                                                      .sellerShippingCost,
                                                            ),
                                                            'order_list_product_list':
                                                                [
                                                              productDetailsPageProductsRecord
                                                                  .reference
                                                            ],
                                                            'order_list_product_list_unique':
                                                                [
                                                              productDetailsPageProductsRecord
                                                                  .reference
                                                            ],
                                                            'order_list_seller_reference':
                                                                [
                                                              productDetailsPageProductsRecord
                                                                  .productSellerReference
                                                            ],
                                                          };
                                                          var orderListRecordReference =
                                                              OrderListRecord
                                                                  .collection
                                                                  .doc();
                                                          await orderListRecordReference
                                                              .set(
                                                                  orderListCreateData);
                                                          _model.orderListOutPut =
                                                              OrderListRecord
                                                                  .getDocumentFromData(
                                                                      orderListCreateData,
                                                                      orderListRecordReference);

                                                          final orderCreateData2 =
                                                              createOrderRecordData(
                                                            orderDate:
                                                                getCurrentTimestamp,
                                                            orderStatus:
                                                                'Processing',
                                                            orderSellerReference:
                                                                productDetailsPageProductsRecord
                                                                    .productSellerReference,
                                                            orderUserReference:
                                                                currentUserReference,
                                                            orderListReference:
                                                                fullWidthBGOrderListRecord!
                                                                    .reference,
                                                            orderProductReference:
                                                                productDetailsPageProductsRecord
                                                                    .reference,
                                                            orderFromListNumber:
                                                                fullWidthBGOrderListRecord!
                                                                    .orderListNumber,
                                                            orderProductPrice:
                                                                productDetailsPageProductsRecord
                                                                    .productPrice,
                                                          );
                                                          await OrderRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  orderCreateData2);

                                                          final productsUpdateData2 =
                                                              {
                                                            'product_inventory':
                                                                FieldValue
                                                                    .increment(
                                                                        -(1)),
                                                          };
                                                          await productDetailsPageProductsRecord
                                                              .reference
                                                              .update(
                                                                  productsUpdateData2);
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.add_circle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('shopping_cart_page');
                                      },
                                      text: 'Go to cart',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
