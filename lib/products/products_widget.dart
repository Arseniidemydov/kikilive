import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().gridSearchActive = false;
      });
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ProductsRecord>>(
      stream: queryProductsRecord(
        queryBuilder: (productsRecord) => productsRecord
            .where('status', isEqualTo: 'active')
            .orderBy('created_at', descending: true),
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
        List<ProductsRecord> productsProductsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          floatingActionButton: StreamBuilder<List<UserOrderRecord>>(
            stream: queryUserOrderRecord(
              parent: currentUserReference,
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
              List<UserOrderRecord> floatingActionButtonUserOrderRecordList =
                  snapshot.data!;
              return FloatingActionButton.extended(
                onPressed: () async {
                  context.pushNamed('shoppingCart');
                },
                backgroundColor: FlutterFlowTheme.of(context).button,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.storefront,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        functions
                            .countCartItems(
                                floatingActionButtonUserOrderRecordList
                                    .map((e) => e.productQuantity)
                                    .withoutNulls
                                    .toList())
                            .toString(),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          appBar: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
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
                              fontSize: 20,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                  elevation: 2,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: StreamBuilder<List<ProductsRecord>>(
                stream: queryProductsRecord(
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
                  List<ProductsRecord> containerProductsRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerProductsRecord =
                      containerProductsRecordList.isNotEmpty
                          ? containerProductsRecordList.first
                          : null;
                  return Container(
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          containerSubCategoryRecordList
                                                  .isNotEmpty
                                              ? containerSubCategoryRecordList
                                                  .first
                                              : null;
                                      return InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().productsRef =
                                                containerProductsRecord!
                                                    .reference;
                                            FFAppState().categoryRef =
                                                containerCategoriesRecord!
                                                    .reference;
                                          });
                                          FFAppState().update(() {
                                            FFAppState().subCategoriesRef =
                                                containerSubCategoryRecord!
                                                    .reference;
                                          });
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                                      10,
                                                                      20,
                                                                      10,
                                                                      10),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ProductsRecord>>(
                                                            stream:
                                                                queryProductsRecord(
                                                              queryBuilder: (productsRecord) => productsRecord
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'active')
                                                                  .orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                                  snapshot
                                                                      .data!;
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      6,
                                                                  mainAxisSpacing:
                                                                      10,
                                                                  childAspectRatio:
                                                                      0.73,
                                                                ),
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    gridViewProductsRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        gridViewIndex) {
                                                                  final gridViewProductsRecord =
                                                                      gridViewProductsRecordList[
                                                                          gridViewIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            OrderNoRecord>>(
                                                                      stream:
                                                                          queryOrderNoRecord(
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<OrderNoRecord>
                                                                            containerOrderNoRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final containerOrderNoRecord = containerOrderNoRecordList.isNotEmpty
                                                                            ? containerOrderNoRecordList.first
                                                                            : null;
                                                                        return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'productDetails',
                                                                              queryParams: {
                                                                                'productDetails': serializeParam(
                                                                                  gridViewProductsRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                20,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(10),
                                                                                bottomRight: Radius.circular(10),
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(5),
                                                                                              child: Image.asset(
                                                                                                'assets/images/default.png',
                                                                                                width: MediaQuery.of(context).size.width,
                                                                                                height: MediaQuery.of(context).size.height * 0.18,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(0),
                                                                                                bottomRight: Radius.circular(0),
                                                                                                topLeft: Radius.circular(5),
                                                                                                topRight: Radius.circular(5),
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                gridViewProductsRecord.productPhoto!,
                                                                                                width: MediaQuery.of(context).size.width,
                                                                                                height: MediaQuery.of(context).size.height * 0.18,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  gridViewProductsRecord.shopName!,
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        fontSize: 14,
                                                                                                        fontWeight: FontWeight.w300,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-0.9, 0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                                                                                            child: Text(
                                                                                              gridViewProductsRecord.productName!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(-0.9, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    gridViewProductsRecord.productPrice!.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Roboto',
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.93, 0.53),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 5),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30,
                                                                                                    buttonSize: 30,
                                                                                                    fillColor: FlutterFlowTheme.of(context).button,
                                                                                                    icon: Icon(
                                                                                                      Icons.add,
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      size: 15,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      FFAppState().update(() {
                                                                                                        FFAppState().orderNo = functions.generateOrderId(containerOrderNoRecord!.orderNo)!;
                                                                                                      });
                                                                                                      await actions.addToCart(
                                                                                                        gridViewProductsRecord.sku,
                                                                                                        currentUserUid,
                                                                                                        0.0,
                                                                                                        0.0,
                                                                                                        functions.generateOrderId(containerOrderNoRecord!.orderNo),
                                                                                                      );
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            'Added Success',
                                                                                                            style: TextStyle(
                                                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 4000),
                                                                                                          backgroundColor: Color(0xFF15D1D1),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
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
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
