import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/live_card/live_card_widget.dart';
import '/components/live_choose_channels/live_choose_channels_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'live_home_page_model.dart';
export 'live_home_page_model.dart';

class LiveHomePageWidget extends StatefulWidget {
  const LiveHomePageWidget({Key? key}) : super(key: key);

  @override
  _LiveHomePageWidgetState createState() => _LiveHomePageWidgetState();
}

class _LiveHomePageWidgetState extends State<LiveHomePageWidget> {
  late LiveHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().chatOpen = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FlutterFlowCheckboxGroup(
                    options: ['Tops', 'Bottoms'],
                    onChanged: (val) =>
                        setState(() => _model.checkboxGroupValues = val),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    checkColor: Colors.white,
                    checkboxBorderColor: Color(0xFF95A1AC),
                    textStyle: FlutterFlowTheme.of(context).bodyText1,
                    initialized: _model.checkboxGroupValues != null,
                  ),
                ),
              ],
            ),
          ],
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
                  Icons.search_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kiki Live',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 20.0,
                        ),
                  ),
                ],
              ),
              actions: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'search_results_page',
                        queryParams: {
                          'tab': serializeParam(
                            2,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.tv_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            )
          : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<ChannelsRecord>>(
                          stream: queryChannelsRecord(
                            queryBuilder: (channelsRecord) => channelsRecord
                                .where('channel_status', isEqualTo: true)
                                .orderBy('created_at'),
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
                            List<ChannelsRecord> rowChannelsRecordList =
                                snapshot.data!;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    rowChannelsRecordList.length, (rowIndex) {
                                  final rowChannelsRecord =
                                      rowChannelsRecordList[rowIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: InkWell(
                                      onTap: () async {
                                        FFAppState().update(() {
                                          FFAppState().channelIndex = rowIndex;
                                        });
                                        FFAppState().update(() {
                                          FFAppState().channelRef =
                                              rowChannelsRecord.reference;
                                        });
                                      },
                                      child: Container(
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: rowChannelsRecord.reference ==
                                                  FFAppState().channelRef
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryColor
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              rowChannelsRecord.channelName!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: rowChannelsRecord
                                                                .reference ==
                                                            FFAppState()
                                                                .channelRef
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                  ),
                                            ),
                                          ),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child:
                      PagedListView<DocumentSnapshot<Object?>?, StreamsRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder = (streamsRecord) => streamsRecord
                              .where('stream_channel_reference',
                                  arrayContains: FFAppState().channelRef)
                              .orderBy('stream_view_online', descending: true);
                      if (_model.pagingController != null) {
                        final query = queryBuilder(StreamsRecord.collection);
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
                          queryBuilder(StreamsRecord.collection);
                      _model.pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryStreamsRecordPage(
                          queryBuilder: (streamsRecord) => streamsRecord
                              .where('stream_channel_reference',
                                  arrayContains: FFAppState().channelRef)
                              .orderBy('stream_view_online', descending: true),
                          nextPageMarker: nextPageMarker,
                          pageSize: 10,
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
                                  .map((k, v) => MapEntry(v.reference.id, k));
                              final index = itemIndexes[item.reference.id];
                              final items = _model.pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _model.pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _model.streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _model.pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<StreamsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: SpinKitDoubleBounce(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 25.0,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewStreamsRecord =
                            _model.pagingController!.itemList![listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 10.0),
                          child: LiveCardWidget(
                            key: Key(
                                'Key83a_${listViewIndex}_of_${_model.pagingController!.itemList!.length}'),
                            streamRef: listViewStreamsRecord.reference,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (valueOrDefault(currentUserDocument?.userRole, '') ==
                    'seller')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.95),
                    child: AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: LiveChooseChannelsWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Broadcast',
                        icon: Icon(
                          Icons.videocam_rounded,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
