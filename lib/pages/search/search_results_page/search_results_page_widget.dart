import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_results_page_model.dart';
export 'search_results_page_model.dart';

class SearchResultsPageWidget extends StatefulWidget {
  const SearchResultsPageWidget({
    Key? key,
    int? tab,
  })  : this.tab = tab ?? 0,
        super(key: key);

  final int tab;

  @override
  _SearchResultsPageWidgetState createState() =>
      _SearchResultsPageWidgetState();
}

class _SearchResultsPageWidgetState extends State<SearchResultsPageWidget> {
  late SearchResultsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsPageModel());

    _model.textController ??= TextEditingController();
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
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  context.pushNamed('products_page');
                },
              ),
              title: Text(
                'Search Result',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _model.textController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 15.0,
                        ),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: min(
                            valueOrDefault<int>(
                              widget.tab,
                              0,
                            ),
                            2),
                        child: Column(
                          children: [
                            TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText1,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              tabs: [
                                Tab(
                                  text: 'Products',
                                ),
                                Tab(
                                  text: 'Shop',
                                ),
                                Tab(
                                  text: 'Channels',
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Search Results for \"${_model.textController.text}\"',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                fontSize: 16.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<int>(
                                                      future:
                                                          queryProductsRecordCount(
                                                        queryBuilder: (productsRecord) => productsRecord
                                                            .where(
                                                                'product_status',
                                                                isEqualTo:
                                                                    'active' !=
                                                                            ''
                                                                        ? 'active'
                                                                        : null)
                                                            .where(
                                                                'product_name',
                                                                isEqualTo: _model
                                                                            .textController
                                                                            .text !=
                                                                        ''
                                                                    ? _model
                                                                        .textController
                                                                        .text
                                                                    : null)
                                                            .where(
                                                                'product_inventory',
                                                                isGreaterThan:
                                                                    random_data
                                                                        .randomInteger(
                                                                            0,
                                                                            0)),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        int textCount =
                                                            snapshot.data!;
                                                        return Text(
                                                          textCount.toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                fontSize: 16.0,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 20.0, 10.0, 10.0),
                                                child: StreamBuilder<
                                                    List<ProductsRecord>>(
                                                  stream: queryProductsRecord(
                                                    queryBuilder: (productsRecord) => productsRecord
                                                        .where('product_status',
                                                            isEqualTo:
                                                                'approved' != ''
                                                                    ? 'approved'
                                                                    : null)
                                                        .where('product_name',
                                                            isEqualTo: _model
                                                                        .textController
                                                                        .text !=
                                                                    ''
                                                                ? _model
                                                                    .textController
                                                                    .text
                                                                : null)
                                                        .where(
                                                            'product_inventory',
                                                            isGreaterThan:
                                                                random_data
                                                                    .randomInteger(
                                                                        0, 0)),
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
                                                    List<ProductsRecord>
                                                        gridViewProductsRecordList =
                                                        snapshot.data!;
                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 0.69,
                                                      ),
                                                      shrinkWrap: true,
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
                                                        return ProductCardWidget(
                                                          key: Key(
                                                              'Keyew7_${gridViewIndex}_of_${gridViewProductsRecordList.length}'),
                                                          productRef:
                                                              gridViewProductsRecord
                                                                  .reference,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Search Results for \"${_model.textController.text}\"',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryUsersRecordCount(
                                                      queryBuilder: (usersRecord) => usersRecord
                                                          .where('user_role',
                                                              isEqualTo:
                                                                  'seller')
                                                          .where('display_name',
                                                              isEqualTo: _model
                                                                          .textController
                                                                          .text !=
                                                                      ''
                                                                  ? _model
                                                                      .textController
                                                                      .text
                                                                  : null),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      int textCount =
                                                          snapshot.data!;
                                                      return Text(
                                                        textCount.toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              fontSize: 16.0,
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 15.0),
                                          child:
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord
                                                      .where(
                                                          'user_role',
                                                          isEqualTo: 'seller')
                                                      .where(
                                                          'display_name',
                                                          isEqualTo: _model
                                                                      .textController
                                                                      .text !=
                                                                  ''
                                                              ? _model
                                                                  .textController
                                                                  .text
                                                              : null),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  columnUsersRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: List.generate(
                                                      columnUsersRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnUsersRecord =
                                                        columnUsersRecordList[
                                                            columnIndex];
                                                    return InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'user_profile_view',
                                                          queryParams: {
                                                            'userRef':
                                                                serializeParam(
                                                              columnUsersRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        columnUsersRecord
                                                                            .photoUrl,
                                                                        'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                                                      ),
                                                                      width:
                                                                          70.0,
                                                                      height:
                                                                          70.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        columnUsersRecord
                                                                            .displayName!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      if (columnUsersRecord
                                                                              .userVerify ??
                                                                          true)
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Verified Shop',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.verified,
                                                                                color: Color(0xFF39BF67),
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          ],
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
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Search Results for \"${_model.textController.text}\"',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryChannelsRecordCount(
                                                      queryBuilder: (channelsRecord) => channelsRecord
                                                          .where(
                                                              'channel_status',
                                                              isEqualTo: true)
                                                          .where('channel_name',
                                                              isEqualTo: _model
                                                                          .textController
                                                                          .text !=
                                                                      ''
                                                                  ? _model
                                                                      .textController
                                                                      .text
                                                                  : null),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      int textCount =
                                                          snapshot.data!;
                                                      return Text(
                                                        textCount.toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              fontSize: 16.0,
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 15.0),
                                          child: StreamBuilder<
                                              List<ChannelsRecord>>(
                                            stream: queryChannelsRecord(
                                              queryBuilder: (channelsRecord) =>
                                                  channelsRecord
                                                      .where('channel_status',
                                                          isEqualTo: true)
                                                      .where('channel_name',
                                                          isEqualTo: _model
                                                                      .textController
                                                                      .text !=
                                                                  ''
                                                              ? _model
                                                                  .textController
                                                                  .text
                                                              : null),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChannelsRecord>
                                                  columnChannelsRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: List.generate(
                                                      columnChannelsRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnChannelsRecord =
                                                        columnChannelsRecordList[
                                                            columnIndex];
                                                    return InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'channel_detaisl_page',
                                                          queryParams: {
                                                            'channelRef':
                                                                serializeParam(
                                                              columnChannelsRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
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
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    columnChannelsRecord
                                                                        .channelName!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          28.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xB3322F37),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.solidCircle,
                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                size: 12.0,
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.05),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: StreamBuilder<List<StreamsRecord>>(
                                                                                  stream: queryStreamsRecord(
                                                                                    queryBuilder: (streamsRecord) => streamsRecord.where('stream_channel_reference', arrayContains: columnChannelsRecord.reference).where('is_live', isEqualTo: true),
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
                                                                                    List<StreamsRecord> textStreamsRecordList = snapshot.data!;
                                                                                    return Text(
                                                                                      formatNumber(
                                                                                        functions.calcLiveViewersChannel(textStreamsRecordList.toList(), -1, textStreamsRecordList.length),
                                                                                        formatType: FormatType.compact,
                                                                                      ),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).btnText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.9,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.05),
                                                                              child: Text(
                                                                                'Viewers',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      color: FlutterFlowTheme.of(context).btnText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.9,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (columnChannelsRecord
                                                                        .channelImage !=
                                                                    null &&
                                                                columnChannelsRecord
                                                                        .channelImage !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1.0,
                                                                  height: 200.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          columnChannelsRecord
                                                                              .channelImage,
                                                                          'https://i.seadn.io/gae/OGpebYaykwlc8Tbk-oGxtxuv8HysLYKqw-FurtYql2UBd_q_-ENAwDY82PkbNB68aTkCINn6tOhpA8pF5SAewC2auZ_44Q77PcOo870?auto=format&w=1920',
                                                                        ),
                                                                      ).image,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          StreamsRecord>>(
                                                                    stream:
                                                                        queryStreamsRecord(
                                                                      queryBuilder: (streamsRecord) => streamsRecord
                                                                          .where(
                                                                              'stream_channel_reference',
                                                                              arrayContains: columnChannelsRecord
                                                                                  .reference)
                                                                          .orderBy(
                                                                              'stream_view_online',
                                                                              descending: true),
                                                                      limit: 4,
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
                                                                            width:
                                                                                25.0,
                                                                            height:
                                                                                25.0,
                                                                            child:
                                                                                SpinKitDoubleBounce(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 25.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<StreamsRecord>
                                                                          gridViewStreamsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return GridView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        gridDelegate:
                                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                                          crossAxisCount:
                                                                              4,
                                                                          crossAxisSpacing:
                                                                              10.0,
                                                                          mainAxisSpacing:
                                                                              10.0,
                                                                          childAspectRatio:
                                                                              1.0,
                                                                        ),
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            gridViewStreamsRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                gridViewIndex) {
                                                                          final gridViewStreamsRecord =
                                                                              gridViewStreamsRecordList[gridViewIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                15.0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                if (gridViewStreamsRecord.isLive!) {
                                                                                  context.pushNamed(
                                                                                    'live_watcher_page',
                                                                                    queryParams: {
                                                                                      'url': serializeParam(
                                                                                        gridViewStreamsRecord.playbackUrl,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'streamID': serializeParam(
                                                                                        gridViewStreamsRecord.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );

                                                                                  final streamsUpdateData1 = {
                                                                                    'stream_view_offline': FieldValue.increment(1),
                                                                                    'stream_view_online': FieldValue.increment(1),
                                                                                  };
                                                                                  await gridViewStreamsRecord.reference.update(streamsUpdateData1);
                                                                                } else {
                                                                                  _model.apiResultvaf = await GetLiveStreamIdCall.call(
                                                                                    playbackId: functions.getPlaybackIdFromUrl(gridViewStreamsRecord.playbackUrl),
                                                                                  );
                                                                                  _model.apiResulto0b = await GetPastLiveStreamCall.call(
                                                                                    streamId: GetLiveStreamIdCall.playBackID(
                                                                                      (_model.apiResultvaf?.jsonBody ?? ''),
                                                                                    ).toString(),
                                                                                  );

                                                                                  context.pushNamed(
                                                                                    'live_watcher_page',
                                                                                    queryParams: {
                                                                                      'url': serializeParam(
                                                                                        functions.createUrlFromPlayId(GetPastLiveStreamCall.playbackID(
                                                                                          (_model.apiResulto0b?.jsonBody ?? ''),
                                                                                        ).toString()),
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'streamID': serializeParam(
                                                                                        gridViewStreamsRecord.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );

                                                                                  final streamsUpdateData2 = {
                                                                                    'stream_view_offline': FieldValue.increment(1),
                                                                                  };
                                                                                  await gridViewStreamsRecord.reference.update(streamsUpdateData2);
                                                                                }

                                                                                setState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                height: 200.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.cover,
                                                                                    image: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        'https://image.mux.com/${gridViewStreamsRecord.streamId}/thumbnail.jpg?width=60&fps=5',
                                                                                        'https://i.seadn.io/gae/OGpebYaykwlc8Tbk-oGxtxuv8HysLYKqw-FurtYql2UBd_q_-ENAwDY82PkbNB68aTkCINn6tOhpA8pF5SAewC2auZ_44Q77PcOo870?auto=format&w=1920',
                                                                                      ),
                                                                                    ).image,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 15.0,
                                                                                  height: 15.0,
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (gridViewStreamsRecord.isLive ?? true)
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-0.85, -0.85),
                                                                                          child: FaIcon(
                                                                                            FontAwesomeIcons.solidCircle,
                                                                                            color: FlutterFlowTheme.of(context).customColor3,
                                                                                            size: 10.0,
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
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
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
  }
}
