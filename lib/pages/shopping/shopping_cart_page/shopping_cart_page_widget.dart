import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
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
import 'shopping_cart_page_model.dart';
export 'shopping_cart_page_model.dart';

class ShoppingCartPageWidget extends StatefulWidget {
  const ShoppingCartPageWidget({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageWidgetState createState() => _ShoppingCartPageWidgetState();
}

class _ShoppingCartPageWidgetState extends State<ShoppingCartPageWidget> {
  late ShoppingCartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoppingCartPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OrderListRecord>>(
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
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 25.0,
              ),
            ),
          );
        }
        List<OrderListRecord> shoppingCartPageOrderListRecordList =
            snapshot.data!;
        final shoppingCartPageOrderListRecord =
            shoppingCartPageOrderListRecordList.isNotEmpty
                ? shoppingCartPageOrderListRecordList.first
                : null;
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
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('products_page');
                    },
                  ),
                  title: Text(
                    'Cart',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 1.0,
                )
              : null,
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      '',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: SelectionArea(
                          child: Text(
                        'Your cart is empty',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                      )),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                      child: SelectionArea(
                          child: Text(
                        'Looks like you have not added anything to you cart. Goahead & explore top categories.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w300,
                            ),
                      )),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.05),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('products_page');
                          },
                          text: 'Start Shopping',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (shoppingCartPageOrderListRecord != null)
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.35),
                                        child: Text(
                                          'Order Number: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.4),
                                        child: Text(
                                          shoppingCartPageOrderListRecord!
                                              .orderListNumber!
                                              .toString(),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              StreamBuilder<List<AddressRecord>>(
                                stream: queryAddressRecord(
                                  queryBuilder: (addressRecord) => addressRecord
                                      .where('address_is_default',
                                          isEqualTo: true)
                                      .where('user_reference',
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 25.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AddressRecord> columnAddressRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnAddressRecord =
                                      columnAddressRecordList.isNotEmpty
                                          ? columnAddressRecordList.first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Shipping  Address',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'address_edit_page',
                                                              queryParams: {
                                                                'addressReference':
                                                                    serializeParam(
                                                                  columnAddressRecord!
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Text(
                                                            'Edit',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .button,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 15.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    FFAppState().update(() {
                                                      FFAppState().addressNav =
                                                          'shoppingcart';
                                                    });
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: columnAddressRecord!
                                                                  .addressLabelName!,
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 35.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1.4,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              columnAddressRecord!
                                                                  .addressShipToName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                columnAddressRecord!
                                                                    .addressShipToPhone!
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              columnAddressRecord!
                                                                  .addressLine1!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                columnAddressRecord!
                                                                    .addressLine2!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              columnAddressRecord!
                                                                  .addressCity!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                columnAddressRecord!
                                                                    .addressZipcode!
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final productsUnique =
                                        shoppingCartPageOrderListRecord!
                                            .orderListProductListUnique!
                                            .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children:
                                          List.generate(productsUnique.length,
                                              (productsUniqueIndex) {
                                        final productsUniqueItem =
                                            productsUnique[productsUniqueIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<OrderRecord>>(
                                                stream: queryOrderRecord(
                                                  queryBuilder: (orderRecord) => orderRecord
                                                      .where(
                                                          'order_list_reference',
                                                          isEqualTo:
                                                              shoppingCartPageOrderListRecord!
                                                                  .reference)
                                                      .where(
                                                          'order_product_reference',
                                                          isEqualTo:
                                                              productsUniqueItem),
                                                  singleRecord: true,
                                                ),
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
                                                  List<OrderRecord>
                                                      productContainerOrderRecordList =
                                                      snapshot.data!;
                                                  final productContainerOrderRecord =
                                                      productContainerOrderRecordList
                                                              .isNotEmpty
                                                          ? productContainerOrderRecordList
                                                              .first
                                                          : null;
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          width: 0.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            ProductsRecord>(
                                                          stream: ProductsRecord
                                                              .getDocument(
                                                                  productsUniqueItem),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 25.0,
                                                                  height: 25.0,
                                                                  child:
                                                                      SpinKitDoubleBounce(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final columnProductsRecord =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              columnProductsRecord.productPhoto!,
                                                                              width: 80.0,
                                                                              height: 80.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(columnProductsRecord.productSellerReference!),
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
                                                                                final textUsersRecord = snapshot.data!;
                                                                                return Text(
                                                                                  textUsersRecord.displayName!,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                columnProductsRecord.productName!,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      fontSize: 13.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                      child: Text(
                                                                                        formatNumber(
                                                                                          columnProductsRecord.productPrice!,
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                          currency: 'THB ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w600,
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
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    UsersRecord>(
                                                                  stream: UsersRecord
                                                                      .getDocument(
                                                                          columnProductsRecord
                                                                              .productSellerReference!),
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final rowUsersRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            if (shoppingCartPageOrderListRecord!.orderListProductList!.toList().contains(columnProductsRecord.reference) ==
                                                                                true) {
                                                                              FFAppState().update(() {
                                                                                FFAppState().ProductListCart = shoppingCartPageOrderListRecord!.orderListProductList!.toList();
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().removeFromProductListCart(columnProductsRecord.reference);
                                                                              });

                                                                              final orderListUpdateData1 = {
                                                                                'order_list_product_list': FFAppState().ProductListCart,
                                                                                'order_list_total': FieldValue.increment(-(columnProductsRecord.productPrice!)),
                                                                                'order_list_seller_reference': FieldValue.arrayRemove([
                                                                                  columnProductsRecord.productSellerReference
                                                                                ]),
                                                                              };
                                                                              await shoppingCartPageOrderListRecord!.reference.update(orderListUpdateData1);

                                                                              final productsUpdateData = {
                                                                                'product_inventory': FieldValue.increment(1),
                                                                              };
                                                                              await columnProductsRecord.reference.update(productsUpdateData);
                                                                              await productContainerOrderRecord!.reference.delete();
                                                                            } else {
                                                                              final orderListUpdateData2 = {
                                                                                'order_list_product_list_unique': FieldValue.arrayRemove([
                                                                                  columnProductsRecord.reference
                                                                                ]),
                                                                                'order_list_seller_reference': FieldValue.arrayRemove([
                                                                                  columnProductsRecord.productSellerReference
                                                                                ]),
                                                                              };
                                                                              await shoppingCartPageOrderListRecord!.reference.update(orderListUpdateData2);
                                                                              await productContainerOrderRecord!.reference.delete();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove_circle_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            shoppingCartPageOrderListRecord!.orderListProductList!.toList().where((e) => e == columnProductsRecord.reference).toList().length.toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            FFAppState().update(() {
                                                                              FFAppState().ProductListCart = shoppingCartPageOrderListRecord!.orderListProductList!.toList();
                                                                            });
                                                                            FFAppState().update(() {
                                                                              FFAppState().addToProductListCart(columnProductsRecord.reference);
                                                                            });

                                                                            final orderListUpdateData =
                                                                                {
                                                                              'order_list_total': FieldValue.increment(columnProductsRecord.productPrice!),
                                                                              'order_list_product_list': FFAppState().ProductListCart,
                                                                              'order_list_seller_reference': FieldValue.arrayUnion([
                                                                                columnProductsRecord.productSellerReference
                                                                              ]),
                                                                            };
                                                                            await shoppingCartPageOrderListRecord!.reference.update(orderListUpdateData);

                                                                            final orderCreateData =
                                                                                createOrderRecordData(
                                                                              orderDate: getCurrentTimestamp,
                                                                              orderStatus: 'Processing',
                                                                              orderSellerReference: columnProductsRecord.productSellerReference,
                                                                              orderProductPrice: columnProductsRecord.productPrice,
                                                                              orderUserReference: currentUserReference,
                                                                              orderFromListNumber: shoppingCartPageOrderListRecord!.orderListNumber,
                                                                              orderListReference: shoppingCartPageOrderListRecord!.reference,
                                                                              orderProductReference: columnProductsRecord.reference,
                                                                            );
                                                                            await OrderRecord.collection.doc().set(orderCreateData);

                                                                            final productsUpdateData =
                                                                                {
                                                                              'product_inventory': FieldValue.increment(-(1)),
                                                                            };
                                                                            await columnProductsRecord.reference.update(productsUpdateData);
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.add_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      1.0,
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                              Divider(
                                height: 2.0,
                                thickness: 1.0,
                                indent: 16.0,
                                endIndent: 16.0,
                                color: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order Summary',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.5,
                                    indent: 16.0,
                                    endIndent: 16.0,
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyText,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Text(
                                          formatNumber(
                                            shoppingCartPageOrderListRecord!
                                                .orderListTotal!,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                            currency: 'THB ',
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 16.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Shipping',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyText,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Text(
                                          formatNumber(
                                            shoppingCartPageOrderListRecord!
                                                .orderListShippingTotal!,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                            currency: 'THB ',
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    indent: 16.0,
                                    endIndent: 16.0,
                                    color: FlutterFlowTheme.of(context).dimLine,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 16.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greyText,
                                                fontSize: 13.0,
                                              ),
                                        ),
                                        Text(
                                          formatNumber(
                                            functions.stripeAmountPayNew(
                                                shoppingCartPageOrderListRecord!
                                                    .orderListShippingTotal!,
                                                shoppingCartPageOrderListRecord!
                                                    .orderListTotal!),
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                            currency: 'THB ',
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontSize: 13.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  StreamBuilder<List<AddressRecord>>(
                                    stream: queryAddressRecord(
                                      queryBuilder: (addressRecord) =>
                                          addressRecord
                                              .where('address_is_default',
                                                  isEqualTo: true)
                                              .where('user_reference',
                                                  isEqualTo:
                                                      currentUserReference),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 25.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<AddressRecord>
                                          containerAddressRecordList =
                                          snapshot.data!;
                                      final containerAddressRecord =
                                          containerAddressRecordList.isNotEmpty
                                              ? containerAddressRecordList.first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.05),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 20.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (containerAddressRecord !=
                                                        null) {
                                                      final paymentResponse =
                                                          await processStripePayment(
                                                        context,
                                                        amount: functions
                                                            .stripeAmountPayNewCart(
                                                                shoppingCartPageOrderListRecord!
                                                                    .orderListShippingTotal!,
                                                                shoppingCartPageOrderListRecord!
                                                                    .orderListTotal!)!
                                                            .round(),
                                                        currency: 'THB',
                                                        customerEmail:
                                                            currentUserEmail,
                                                        customerName:
                                                            currentUserDisplayName,
                                                        description:
                                                            'Transaction',
                                                        allowGooglePay: false,
                                                        allowApplePay: false,
                                                        themeStyle:
                                                            ThemeMode.system,
                                                      );
                                                      if (paymentResponse
                                                              .paymentId ==
                                                          null) {
                                                        if (paymentResponse
                                                                .errorMessage !=
                                                            null) {
                                                          showSnackbar(
                                                            context,
                                                            'Error: ${paymentResponse.errorMessage}',
                                                          );
                                                        }
                                                        return;
                                                      }
                                                      _model.paymentId =
                                                          paymentResponse
                                                              .paymentId!;

                                                      if (_model.paymentId !=
                                                              null &&
                                                          _model.paymentId !=
                                                              '') {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .paymentStatus =
                                                              true;
                                                        });

                                                        final usersUpdateData =
                                                            {
                                                          'user_point': FieldValue
                                                              .increment(functions
                                                                  .calcPoints(
                                                                      shoppingCartPageOrderListRecord!
                                                                          .orderListTotal!)!),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData);

                                                        context.pushNamed(
                                                          'payment_success_page',
                                                          queryParams: {
                                                            'paymentStatus':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                            'transactionId':
                                                                serializeParam(
                                                              _model.paymentId,
                                                              ParamType.String,
                                                            ),
                                                            'orderlist':
                                                                serializeParam(
                                                              shoppingCartPageOrderListRecord!
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        final orderListUpdateData =
                                                            createOrderListRecordData(
                                                          orderListIsPaid: true,
                                                          orderListPaymentId:
                                                              _model.paymentId,
                                                          orderListAddressReference:
                                                              containerAddressRecord!
                                                                  .reference,
                                                        );
                                                        await shoppingCartPageOrderListRecord!
                                                            .reference
                                                            .update(
                                                                orderListUpdateData);
                                                      } else {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .paymentStatus =
                                                              false;
                                                        });

                                                        context.pushNamed(
                                                          'payment_success_page',
                                                          queryParams: {
                                                            'paymentStatus':
                                                                serializeParam(
                                                              false,
                                                              ParamType.bool,
                                                            ),
                                                            'transactionId':
                                                                serializeParam(
                                                              _model.paymentId,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    } else {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'No Address Located'),
                                                                    content: Text(
                                                                        'We notice that you don\'t have any address, please add one.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Add Address'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        context.pushNamed(
                                                            'address_add_page');
                                                      }
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Checkout',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
