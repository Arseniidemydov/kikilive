import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_model.dart';
export 'products_model.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  late ProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().gridSearchActive = false;
      });
    });
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          context.pushNamed('shoppingCart');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        label: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.storefront,
                color: FlutterFlowTheme.of(context).secondaryColor,
                size: 24,
              ),
              StreamBuilder<List<OrderListRecord>>(
                stream: queryOrderListRecord(
                  queryBuilder: (orderListRecord) => orderListRecord
                      .where('isPaid', isEqualTo: false)
                      .where('user_Ref', isEqualTo: currentUserReference),
                  singleRecord: true,
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
                  List<OrderListRecord> containerOrderListRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerOrderListRecord =
                      containerOrderListRecordList.isNotEmpty
                          ? containerOrderListRecordList.first
                          : null;
                  return Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        valueOrDefault<String>(
                          containerOrderListRecord!.productsList!
                              .toList()
                              .length
                              .toString(),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () async {
                  context.pushNamed('searchResults');
                },
                child: Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 16,
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Products',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              actions: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: StreamBuilder<List<SubCategoryRecord>>(
                    stream: querySubCategoryRecord(
                      singleRecord: true,
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
                      List<SubCategoryRecord> iconSubCategoryRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final iconSubCategoryRecord =
                          iconSubCategoryRecordList.isNotEmpty
                              ? iconSubCategoryRecordList.first
                              : null;
                      return InkWell(
                        onTap: () async {
                          context.pushNamed('shops');
                        },
                        child: Icon(
                          Icons.local_convenience_store_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 1,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: StreamBuilder<List<CategoriesRecord>>(
                  stream: queryCategoriesRecord(
                    singleRecord: true,
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
                    List<CategoriesRecord> containerCategoriesRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerCategoriesRecord =
                        containerCategoriesRecordList.isNotEmpty
                            ? containerCategoriesRecordList.first
                            : null;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<SubCategoryRecord>>(
                                stream: querySubCategoryRecord(
                                  singleRecord: true,
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
                                  List<SubCategoryRecord>
                                      containerSubCategoryRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerSubCategoryRecord =
                                      containerSubCategoryRecordList.isNotEmpty
                                          ? containerSubCategoryRecordList.first
                                          : null;
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.83,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Stack(
                                              children: [
                                                if (!FFAppState()
                                                    .gridSearchActive)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 20, 10, 10),
                                                    child: StreamBuilder<
                                                        List<ProductsRecord>>(
                                                      stream:
                                                          queryProductsRecord(
                                                        queryBuilder: (productsRecord) =>
                                                            productsRecord
                                                                .where('status',
                                                                    isEqualTo:
                                                                        'active')
                                                                .orderBy(
                                                                    'created_at',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<ProductsRecord>
                                                            gridViewProductsRecordList =
                                                            snapshot.data!;
                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing: 6,
                                                            mainAxisSpacing: 10,
                                                            childAspectRatio:
                                                                0.66,
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              gridViewProductsRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              gridViewIndex) {
                                                            final gridViewProductsRecord =
                                                                gridViewProductsRecordList[
                                                                    gridViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          5,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'productDetails',
                                                                    queryParams:
                                                                        {
                                                                      'productDetails':
                                                                          serializeParam(
                                                                        gridViewProductsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 200,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.2,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .background,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/default.png',
                                                                              width: MediaQuery.of(context).size.width,
                                                                              height: MediaQuery.of(context).size.height * 0.2,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0),
                                                                              bottomRight: Radius.circular(0),
                                                                              topLeft: Radius.circular(5),
                                                                              topRight: Radius.circular(5),
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              gridViewProductsRecord.productPhoto!,
                                                                              width: MediaQuery.of(context).size.width,
                                                                              height: MediaQuery.of(context).size.height * 0.2,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Text(
                                                                              gridViewProductsRecord.shopName!,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).greyText,
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w300,
                                                                                  ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.45,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x0049454F),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                                  child: Text(
                                                                                    gridViewProductsRecord.productName!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          fontSize: 14,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0, 0),
                                                                                            child: Text(
                                                                                              formatNumber(
                                                                                                gridViewProductsRecord.productPrice!,
                                                                                                formatType: FormatType.decimal,
                                                                                                decimalType: DecimalType.automatic,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0, 0),
                                                                                            child: Text(
                                                                                              ' THB',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          StreamBuilder<UsersRecord>(
                                                                                            stream: UsersRecord.getDocument(gridViewProductsRecord.shopRef!),
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
                                                                                              final containerUsersRecord = snapshot.data!;
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: FutureBuilder<int>(
                                                                                                  future: queryOrderListRecordCount(),
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
                                                                                                    int containerCount = snapshot.data!;
                                                                                                    return Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.93, 0.53),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 5),
                                                                                                          child: StreamBuilder<List<OrderListRecord>>(
                                                                                                            stream: queryOrderListRecord(
                                                                                                              queryBuilder: (orderListRecord) => orderListRecord.where('isPaid', isEqualTo: false).where('user_Ref', isEqualTo: currentUserReference),
                                                                                                              singleRecord: true,
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
                                                                                                              List<OrderListRecord> iconAddProductOrderListRecordList = snapshot.data!;
                                                                                                              final iconAddProductOrderListRecord = iconAddProductOrderListRecordList.isNotEmpty ? iconAddProductOrderListRecordList.first : null;
                                                                                                              return FlutterFlowIconButton(
                                                                                                                borderColor: Colors.transparent,
                                                                                                                borderRadius: 30,
                                                                                                                buttonSize: 30,
                                                                                                                fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                icon: Icon(
                                                                                                                  Icons.add,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                  size: 15,
                                                                                                                ),
                                                                                                                onPressed: () async {
                                                                                                                  if (iconAddProductOrderListRecord != null) {
                                                                                                                    FFAppState().update(() {
                                                                                                                      FFAppState().ProductListCart = iconAddProductOrderListRecord!.productsList!.toList();
                                                                                                                    });
                                                                                                                    FFAppState().update(() {
                                                                                                                      FFAppState().addToProductListCart(gridViewProductsRecord.reference);
                                                                                                                    });

                                                                                                                    final orderListUpdateData = {
                                                                                                                      'productsList': FFAppState().ProductListCart,
                                                                                                                      'order_total': FieldValue.increment(gridViewProductsRecord.productPrice!),
                                                                                                                      'productsListUnique': FieldValue.arrayUnion([gridViewProductsRecord.reference]),
                                                                                                                    };
                                                                                                                    await iconAddProductOrderListRecord!.reference.update(orderListUpdateData);

                                                                                                                    final ordersCreateData1 = createOrdersRecordData(
                                                                                                                      orderDate: getCurrentTimestamp,
                                                                                                                      shopRef: gridViewProductsRecord.shopRef,
                                                                                                                      productName: gridViewProductsRecord.productName,
                                                                                                                      productPrice: gridViewProductsRecord.productPrice,
                                                                                                                      orderStatus: 'Processing',
                                                                                                                      userRef: currentUserReference,
                                                                                                                      orderNumber: iconAddProductOrderListRecord!.orderNo,
                                                                                                                      productImage: gridViewProductsRecord.productPhoto,
                                                                                                                      orderListRef: iconAddProductOrderListRecord!.reference,
                                                                                                                      productRef: gridViewProductsRecord.reference,
                                                                                                                    );
                                                                                                                    await OrdersRecord.collection.doc().set(ordersCreateData1);
                                                                                                                  } else {
                                                                                                                    final orderListCreateData = {
                                                                                                                      ...createOrderListRecordData(
                                                                                                                        orderDate: getCurrentTimestamp,
                                                                                                                        userRef: currentUserReference,
                                                                                                                        isPaid: false,
                                                                                                                        orderNo: functions.orderNoCalculateNew(containerCount).toString(),
                                                                                                                        orderTotal: gridViewProductsRecord.productPrice,
                                                                                                                        shippingTotal: containerUsersRecord.shippingCost,
                                                                                                                      ),
                                                                                                                      'productsList': [gridViewProductsRecord.reference],
                                                                                                                      'productsListUnique': [gridViewProductsRecord.reference],
                                                                                                                    };
                                                                                                                    var orderListRecordReference = OrderListRecord.collection.doc();
                                                                                                                    await orderListRecordReference.set(orderListCreateData);
                                                                                                                    _model.orderListOutPut = OrderListRecord.getDocumentFromData(orderListCreateData, orderListRecordReference);

                                                                                                                    final ordersCreateData2 = createOrdersRecordData(
                                                                                                                      orderDate: getCurrentTimestamp,
                                                                                                                      shopRef: gridViewProductsRecord.shopRef,
                                                                                                                      productName: gridViewProductsRecord.productName,
                                                                                                                      productPrice: gridViewProductsRecord.productPrice,
                                                                                                                      orderStatus: 'Processing',
                                                                                                                      userRef: currentUserReference,
                                                                                                                      orderNumber: _model.orderListOutPut!.orderNo,
                                                                                                                      productImage: gridViewProductsRecord.productPhoto,
                                                                                                                      orderListRef: _model.orderListOutPut!.reference,
                                                                                                                      productRef: gridViewProductsRecord.reference,
                                                                                                                    );
                                                                                                                    await OrdersRecord.collection.doc().set(ordersCreateData2);
                                                                                                                  }

                                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                    SnackBar(
                                                                                                                      content: Text(
                                                                                                                        'Product added to car',
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                                      backgroundColor: Color(0x00000000),
                                                                                                                      action: SnackBarAction(
                                                                                                                        label: 'Cart',
                                                                                                                        textColor: Color(0x00000000),
                                                                                                                        onPressed: () async {
                                                                                                                          context.pushNamed('shoppingCart');
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
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
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
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
