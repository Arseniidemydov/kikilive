import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'order_management_model.dart';
export 'order_management_model.dart';

class OrderManagementWidget extends StatefulWidget {
  const OrderManagementWidget({Key? key}) : super(key: key);

  @override
  _OrderManagementWidgetState createState() => _OrderManagementWidgetState();
}

class _OrderManagementWidgetState extends State<OrderManagementWidget> {
  late OrderManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderManagementModel());
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                'Order Management',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).customColor4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Orders',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.78,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          OrderListRecord>(
                        pagingController: () {
                          final Query<Object?> Function(Query<Object?>)
                              queryBuilder = (orderListRecord) =>
                                  orderListRecord
                                      .where('isPaid', isEqualTo: true)
                                      .orderBy('order_no', descending: true);
                          if (_model.pagingController != null) {
                            final query =
                                queryBuilder(OrderListRecord.collection);
                            if (query != _model.pagingQuery) {
                              // The query has changed
                              _model.pagingQuery = query;
                              _model.streamSubscriptions
                                  .forEach((s) => s?.cancel());
                              _model.streamSubscriptions.clear();
                              _model.pagingController!.refresh();
                            }
                            return _model.pagingController!;
                          }

                          _model.pagingController =
                              PagingController(firstPageKey: null);
                          _model.pagingQuery =
                              queryBuilder(OrderListRecord.collection);
                          _model.pagingController!
                              .addPageRequestListener((nextPageMarker) {
                            queryOrderListRecordPage(
                              queryBuilder: (orderListRecord) => orderListRecord
                                  .where('isPaid', isEqualTo: true)
                                  .orderBy('order_no', descending: true),
                              nextPageMarker: nextPageMarker,
                              pageSize: 25,
                              isStream: true,
                            ).then((page) {
                              _model.pagingController!.appendPage(
                                page.data,
                                page.nextPageMarker,
                              );
                              final streamSubscription =
                                  page.dataStream?.listen((data) {
                                data.forEach((item) {
                                  final itemIndexes = _model
                                      .pagingController!.itemList!
                                      .asMap()
                                      .map((k, v) =>
                                          MapEntry(v.reference.id, k));
                                  final index = itemIndexes[item.reference.id];
                                  final items =
                                      _model.pagingController!.itemList!;
                                  if (index != null) {
                                    items
                                        .replaceRange(index, index + 1, [item]);
                                    _model.pagingController!.itemList = {
                                      for (var item in items)
                                        item.reference: item
                                    }.values.toList();
                                  }
                                });
                                setState(() {});
                              });
                              _model.streamSubscriptions
                                  .add(streamSubscription);
                            });
                          });
                          return _model.pagingController!;
                        }(),
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        builderDelegate:
                            PagedChildBuilderDelegate<OrderListRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewOrderListRecord = _model
                                .pagingController!.itemList![listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: StreamBuilder<List<OrdersRecord>>(
                                stream: queryOrdersRecord(
                                  queryBuilder: (ordersRecord) =>
                                      ordersRecord.where('order_number',
                                          isEqualTo:
                                              listViewOrderListRecord.orderNo),
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
                                  List<OrdersRecord> containerOrdersRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerOrdersRecord =
                                      containerOrdersRecordList.isNotEmpty
                                          ? containerOrdersRecordList.first
                                          : null;
                                  return InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'orderDetailsPreview',
                                        queryParams: {
                                          'orderList': serializeParam(
                                            listViewOrderListRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userRef': serializeParam(
                                            listViewOrderListRecord.userRef,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Order Date',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          'yMMMd',
                                                          listViewOrderListRecord
                                                              .orderDate!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Order Number:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                      Text(
                                                        listViewOrderListRecord
                                                            .orderNo!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(5),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(5),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
