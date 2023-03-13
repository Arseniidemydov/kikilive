import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_page_model.dart';
export 'products_page_model.dart';

class ProductsPageWidget extends StatefulWidget {
  const ProductsPageWidget({Key? key}) : super(key: key);

  @override
  _ProductsPageWidgetState createState() => _ProductsPageWidgetState();
}

class _ProductsPageWidgetState extends State<ProductsPageWidget> {
  late ProductsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsPageModel());
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
      floatingActionButton: StreamBuilder<List<OrderListRecord>>(
        stream: queryOrderListRecord(
          queryBuilder: (orderListRecord) => orderListRecord
              .where('order_list_user_reference',
                  isEqualTo: currentUserReference)
              .where('order_list_is_paid', isEqualTo: false),
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
          List<OrderListRecord> floatingActionButtonOrderListRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final floatingActionButtonOrderListRecord =
              floatingActionButtonOrderListRecordList.isNotEmpty
                  ? floatingActionButtonOrderListRecordList.first
                  : null;
          return FloatingActionButton.extended(
            onPressed: () async {
              context.pushNamed('shopping_cart_page');
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            label: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 24.0,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            floatingActionButtonOrderListRecord!
                                .orderListProductList!
                                .toList()
                                .length
                                .toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'items',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
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
      ),
      appBar: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () async {
                  context.pushNamed(
                    'search_results_page',
                    queryParams: {
                      'tab': serializeParam(
                        0,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 16.0,
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Products',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
              actions: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'search_results_page',
                        queryParams: {
                          'tab': serializeParam(
                            1,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.local_convenience_store_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 1.0,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
                child: StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord
                        .where('product_status', isEqualTo: 'approved')
                        .where('product_inventory',
                            isGreaterThan: random_data.randomInteger(0, 0)),
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
                    List<ProductsRecord> gridViewProductsRecordList =
                        snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.69,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: gridViewProductsRecordList.length,
                      itemBuilder: (context, gridViewIndex) {
                        final gridViewProductsRecord =
                            gridViewProductsRecordList[gridViewIndex];
                        return ProductCardWidget(
                          key: Key(
                              'Key38h_${gridViewIndex}_of_${gridViewProductsRecordList.length}'),
                          productRef: gridViewProductsRecord.reference,
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
    );
  }
}
