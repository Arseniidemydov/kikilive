import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    Key? key,
    this.productRef,
  }) : super(key: key);

  final DocumentReference? productRef;

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late ProductCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ProductsRecord>(
      stream: ProductsRecord.getDocument(widget.productRef!),
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
        final containerProductsRecord = snapshot.data!;
        return InkWell(
          onTap: () async {
            context.pushNamed(
              'product_details_page',
              queryParams: {
                'productDetails': serializeParam(
                  widget.productRef,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: 250.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      child: Image.network(
                        containerProductsRecord.productPhoto!,
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            containerProductsRecord.productSellerReference!),
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
                          final textUsersRecord = snapshot.data!;
                          return Text(
                            textUsersRecord.displayName!,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: FlutterFlowTheme.of(context).greyText,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          );
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: Text(
                            containerProductsRecord.productName!
                                .maybeHandleOverflow(
                              maxChars: 30,
                              replacement: '…',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 14.0,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        formatNumber(
                                          containerProductsRecord.productPrice!,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        ' THB',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 8.0, 0.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    containerProductsRecord
                                        .productSellerReference!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitDoubleBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final containerUsersRecord = snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: FutureBuilder<int>(
                                      future: queryOrderListRecordCount(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitDoubleBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        int containerCount = snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: StreamBuilder<
                                              List<OrderListRecord>>(
                                            stream: queryOrderListRecord(
                                              queryBuilder: (orderListRecord) =>
                                                  orderListRecord
                                                      .where(
                                                          'order_list_is_paid',
                                                          isEqualTo: false)
                                                      .where(
                                                          'order_list_user_reference',
                                                          isEqualTo:
                                                              currentUserReference),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    child: SpinKitDoubleBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<OrderListRecord>
                                                  iconAddProductOrderListRecordList =
                                                  snapshot.data!;
                                              final iconAddProductOrderListRecord =
                                                  iconAddProductOrderListRecordList
                                                          .isNotEmpty
                                                      ? iconAddProductOrderListRecordList
                                                          .first
                                                      : null;
                                              return FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 30.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                icon: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  size: 15.0,
                                                ),
                                                onPressed: () async {
                                                  if (iconAddProductOrderListRecord !=
                                                      null) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .ProductListCart =
                                                          iconAddProductOrderListRecord!
                                                              .orderListProductList!
                                                              .toList();
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .addToProductListCart(
                                                              containerProductsRecord
                                                                  .reference);
                                                    });

                                                    final orderListUpdateData =
                                                        {
                                                      'order_list_product_list':
                                                          FFAppState()
                                                              .ProductListCart,
                                                      'order_list_total':
                                                          FieldValue.increment(
                                                              containerProductsRecord
                                                                  .productPrice!),
                                                      'order_list_product_list_unique':
                                                          FieldValue
                                                              .arrayUnion([
                                                        containerProductsRecord
                                                            .reference
                                                      ]),
                                                      'order_list_seller_reference':
                                                          FieldValue
                                                              .arrayUnion([
                                                        containerProductsRecord
                                                            .productSellerReference
                                                      ]),
                                                    };
                                                    await iconAddProductOrderListRecord!
                                                        .reference
                                                        .update(
                                                            orderListUpdateData);

                                                    final orderCreateData1 =
                                                        createOrderRecordData(
                                                      orderDate:
                                                          getCurrentTimestamp,
                                                      orderStatus: 'Processing',
                                                      orderSellerReference:
                                                          containerProductsRecord
                                                              .productSellerReference,
                                                      orderUserReference:
                                                          currentUserReference,
                                                      orderListReference:
                                                          iconAddProductOrderListRecord!
                                                              .reference,
                                                      orderProductReference:
                                                          containerProductsRecord
                                                              .reference,
                                                      orderProductPrice:
                                                          containerProductsRecord
                                                              .productPrice,
                                                    );
                                                    await OrderRecord.collection
                                                        .doc()
                                                        .set(orderCreateData1);

                                                    final productsUpdateData1 =
                                                        {
                                                      'product_inventory':
                                                          FieldValue.increment(
                                                              -(1)),
                                                    };
                                                    await containerProductsRecord
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
                                                        orderListIsPaid: false,
                                                        orderListNumber: functions
                                                            .orderNoCalculateNew(
                                                                containerCount),
                                                        orderListTotal:
                                                            containerProductsRecord
                                                                .productPrice,
                                                        orderListShippingTotal:
                                                            containerUsersRecord
                                                                .sellerShippingCost,
                                                      ),
                                                      'order_list_product_list':
                                                          [
                                                        containerProductsRecord
                                                            .reference
                                                      ],
                                                      'order_list_product_list_unique':
                                                          [
                                                        containerProductsRecord
                                                            .reference
                                                      ],
                                                      'order_list_seller_reference':
                                                          [
                                                        containerProductsRecord
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
                                                      orderStatus: 'Processing',
                                                      orderSellerReference:
                                                          containerProductsRecord
                                                              .productSellerReference,
                                                      orderUserReference:
                                                          currentUserReference,
                                                      orderListReference: _model
                                                          .orderListOutPut!
                                                          .reference,
                                                      orderProductReference:
                                                          containerProductsRecord
                                                              .reference,
                                                      orderProductPrice:
                                                          containerProductsRecord
                                                              .productPrice,
                                                    );
                                                    await OrderRecord.collection
                                                        .doc()
                                                        .set(orderCreateData2);

                                                    final productsUpdateData2 =
                                                        {
                                                      'product_inventory':
                                                          FieldValue.increment(
                                                              -(1)),
                                                    };
                                                    await containerProductsRecord
                                                        .reference
                                                        .update(
                                                            productsUpdateData2);
                                                  }

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Product added to cart',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      action: SnackBarAction(
                                                        label: 'Cart',
                                                        textColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              'shopping_cart_page');
                                                        },
                                                      ),
                                                    ),
                                                  );

                                                  setState(() {});
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
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
