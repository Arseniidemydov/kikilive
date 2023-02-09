import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductPopWidget extends StatefulWidget {
  const ProductPopWidget({
    Key? key,
    this.userID,
  }) : super(key: key);

  final DocumentReference? userID;

  @override
  _ProductPopWidgetState createState() => _ProductPopWidgetState();
}

class _ProductPopWidgetState extends State<ProductPopWidget> {
  OrderListRecord? orderListOutPut;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'All Products',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord
                        .where('user_ref', isEqualTo: widget.userID)
                        .orderBy('product_name'),
                  ),
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
                    List<ProductsRecord> gridViewProductsRecordList =
                        snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.66,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: gridViewProductsRecordList.length,
                      itemBuilder: (context, gridViewIndex) {
                        final gridViewProductsRecord =
                            gridViewProductsRecordList[gridViewIndex];
                        return Container(
                          width: 10,
                          height: 100,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      gridViewProductsRecord.productPhoto!,
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 2),
                                      child: Text(
                                        gridViewProductsRecord.category!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 5, 0),
                                      child: Text(
                                        gridViewProductsRecord.productName!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          widget.userID!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final rowUsersRecord = snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 5, 0),
                                              child: Text(
                                                formatNumber(
                                                  gridViewProductsRecord
                                                      .productPrice!,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: 'THB ',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            FutureBuilder<int>(
                                              future:
                                                  queryOrderListRecordCount(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int containerCount =
                                                    snapshot.data!;
                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.93, 0.53),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 5),
                                                      child: StreamBuilder<
                                                          List<
                                                              OrderListRecord>>(
                                                        stream:
                                                            queryOrderListRecord(
                                                          queryBuilder: (orderListRecord) =>
                                                              orderListRecord
                                                                  .where(
                                                                      'isPaid',
                                                                      isEqualTo:
                                                                          false)
                                                                  .where(
                                                                      'user_Ref',
                                                                      isEqualTo:
                                                                          currentUserReference),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
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
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            buttonSize: 30,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              size: 15,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (iconAddProductOrderListRecord !=
                                                                  null) {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .ProductListCart =
                                                                      iconAddProductOrderListRecord!
                                                                          .productsList!
                                                                          .toList();
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState().addToProductListCart(
                                                                      gridViewProductsRecord
                                                                          .reference);
                                                                });

                                                                final orderListUpdateData =
                                                                    {
                                                                  'productsList':
                                                                      FFAppState()
                                                                          .ProductListCart,
                                                                  'order_total':
                                                                      FieldValue.increment(
                                                                          gridViewProductsRecord
                                                                              .productPrice!),
                                                                  'productsListUnique':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    gridViewProductsRecord
                                                                        .reference
                                                                  ]),
                                                                };
                                                                await iconAddProductOrderListRecord!
                                                                    .reference
                                                                    .update(
                                                                        orderListUpdateData);

                                                                final ordersCreateData =
                                                                    createOrdersRecordData(
                                                                  orderDate:
                                                                      getCurrentTimestamp,
                                                                  shopRef:
                                                                      gridViewProductsRecord
                                                                          .shopRef,
                                                                  productName:
                                                                      gridViewProductsRecord
                                                                          .productName,
                                                                  productPrice:
                                                                      gridViewProductsRecord
                                                                          .productPrice,
                                                                  orderStatus:
                                                                      'Processing',
                                                                  userRef:
                                                                      currentUserReference,
                                                                  orderNumber:
                                                                      iconAddProductOrderListRecord!
                                                                          .orderNo,
                                                                  productImage:
                                                                      gridViewProductsRecord
                                                                          .productPhoto,
                                                                  orderListRef:
                                                                      iconAddProductOrderListRecord!
                                                                          .reference,
                                                                  productRef:
                                                                      gridViewProductsRecord
                                                                          .reference,
                                                                );
                                                                await OrdersRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        ordersCreateData);
                                                              } else {
                                                                final orderListCreateData =
                                                                    {
                                                                  ...createOrderListRecordData(
                                                                    orderDate:
                                                                        getCurrentTimestamp,
                                                                    userRef:
                                                                        currentUserReference,
                                                                    isPaid:
                                                                        false,
                                                                    orderNo: functions
                                                                        .orderNoCalculateNew(
                                                                            containerCount)
                                                                        .toString(),
                                                                    orderTotal:
                                                                        gridViewProductsRecord
                                                                            .productPrice,
                                                                    shippingTotal:
                                                                        rowUsersRecord
                                                                            .shippingCost,
                                                                  ),
                                                                  'productsList':
                                                                      [
                                                                    gridViewProductsRecord
                                                                        .reference
                                                                  ],
                                                                  'productsListUnique':
                                                                      [
                                                                    gridViewProductsRecord
                                                                        .reference
                                                                  ],
                                                                };
                                                                var orderListRecordReference =
                                                                    OrderListRecord
                                                                        .collection
                                                                        .doc();
                                                                await orderListRecordReference
                                                                    .set(
                                                                        orderListCreateData);
                                                                orderListOutPut =
                                                                    OrderListRecord.getDocumentFromData(
                                                                        orderListCreateData,
                                                                        orderListRecordReference);

                                                                final ordersCreateData =
                                                                    createOrdersRecordData(
                                                                  orderDate:
                                                                      getCurrentTimestamp,
                                                                  shopRef: widget
                                                                      .userID,
                                                                  productName:
                                                                      gridViewProductsRecord
                                                                          .productName,
                                                                  productPrice:
                                                                      gridViewProductsRecord
                                                                          .productPrice,
                                                                  orderStatus:
                                                                      'Processing',
                                                                  userRef:
                                                                      currentUserReference,
                                                                  orderNumber:
                                                                      orderListOutPut!
                                                                          .orderNo,
                                                                  productImage:
                                                                      gridViewProductsRecord
                                                                          .productPhoto,
                                                                  orderListRef:
                                                                      orderListOutPut!
                                                                          .reference,
                                                                  productRef:
                                                                      gridViewProductsRecord
                                                                          .reference,
                                                                );
                                                                await OrdersRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        ordersCreateData);
                                                              }

                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Product added to car',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  action:
                                                                      SnackBarAction(
                                                                    label:
                                                                        'Cart',
                                                                    textColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    onPressed:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'shoppingCart');
                                                                    },
                                                                  ),
                                                                ),
                                                              );

                                                              setState(() {});
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
