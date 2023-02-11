import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/broadcast_name_widget.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'live_model.dart';
export 'live_model.dart';

class LiveWidget extends StatefulWidget {
  const LiveWidget({Key? key}) : super(key: key);

  @override
  _LiveWidgetState createState() => _LiveWidgetState();
}

class _LiveWidgetState extends State<LiveWidget> {
  late LiveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveModel());

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
        elevation: 16,
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
                  context.pushNamed('searchResults');
                },
                child: Icon(
                  Icons.search_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kiki Live',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Roboto',
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
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'channelList',
                        queryParams: {
                          'url': serializeParam(
                            '',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.tv_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0,
            )
          : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                            queryBuilder: (channelsRecord) =>
                                channelsRecord.orderBy('channel_created_on'),
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
                                        0, 0, 8, 0),
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
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: rowChannelsRecord.reference ==
                                                  FFAppState().channelRef
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryColor
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
                                            child: Text(
                                              rowChannelsRecord.channelName!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
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
                  alignment: AlignmentDirectional(0, 0),
                  child: StreamBuilder<List<StreamsRecord>>(
                    stream: queryStreamsRecord(
                      queryBuilder: (streamsRecord) => streamsRecord
                          .where('channel_reference',
                              arrayContains: FFAppState().channelRef)
                          .orderBy('stream_view_online', descending: true),
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
                      List<StreamsRecord> listViewStreamsRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewStreamsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewStreamsRecord =
                              listViewStreamsRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 20, 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.65,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      if (listViewStreamsRecord.isLive!) {
                                        context.pushNamed(
                                          'livestreamViewer',
                                          queryParams: {
                                            'url': serializeParam(
                                              listViewStreamsRecord.playbackUrl,
                                              ParamType.String,
                                            ),
                                            'streamID': serializeParam(
                                              listViewStreamsRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.apiResultvaf =
                                            await GetLiveStreamIdCall.call(
                                          playbackId:
                                              functions.getPlaybackIdFromUrl(
                                                  listViewStreamsRecord
                                                      .playbackUrl),
                                        );
                                        _model.apiResulto0b =
                                            await GetPastLiveStreamCall.call(
                                          streamId:
                                              GetLiveStreamIdCall.playBackID(
                                            (_model.apiResultvaf?.jsonBody ??
                                                ''),
                                          ).toString(),
                                        );

                                        context.pushNamed(
                                          'livestreamViewer',
                                          queryParams: {
                                            'url': serializeParam(
                                              functions.createUrlFromPlayId(
                                                  GetPastLiveStreamCall
                                                      .playbackID(
                                                (_model.apiResulto0b
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()),
                                              ParamType.String,
                                            ),
                                            'streamID': serializeParam(
                                              listViewStreamsRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.54,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              'https://image.mux.com/${listViewStreamsRecord.streamId}/animated.webp?width=180&fps=5',
                                              'https://i.seadn.io/gae/OGpebYaykwlc8Tbk-oGxtxuv8HysLYKqw-FurtYql2UBd_q_-ENAwDY82PkbNB68aTkCINn6tOhpA8pF5SAewC2auZ_44Q77PcOo870?auto=format&w=1920',
                                            ),
                                          ).image,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (listViewStreamsRecord
                                                      .isLive ??
                                                  true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, -1),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 15, 0, 0),
                                                    child: Container(
                                                      width: 45,
                                                      height: 28,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0.05),
                                                        child: Text(
                                                          'LIVE',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .btnText,
                                                                fontSize: 12,
                                                                letterSpacing:
                                                                    0.9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (listViewStreamsRecord
                                                      .isLive ??
                                                  true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, -1),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 15, 12, 0),
                                                    child: Container(
                                                      height: 28,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xB3322F37),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          5,
                                                                          0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidCircle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor3,
                                                                size: 12,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0.05),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                child: Text(
                                                                  formatNumber(
                                                                    listViewStreamsRecord
                                                                        .streamViewOnline!,
                                                                    formatType:
                                                                        FormatType
                                                                            .compact,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .btnText,
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            0.9,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0.05),
                                                              child: Text(
                                                                'Viewers',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .btnText,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.9,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
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
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 10),
                                          child: Text(
                                            listViewStreamsRecord.playbackName!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                        StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              listViewStreamsRecord.userRef!),
                                          builder: (context, snapshot) {
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
                                            final rowUsersRecord =
                                                snapshot.data!;
                                            return InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'userProfileView',
                                                  queryParams: {
                                                    'shopReference':
                                                        serializeParam(
                                                      rowUsersRecord.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 10, 0),
                                                    child: Container(
                                                      width: 28,
                                                      height: 28,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            rowUsersRecord
                                                                .photoUrl!,
                                                          ).image,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 2),
                                                    child: Text(
                                                      rowUsersRecord
                                                          .displayName!,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
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
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                if (valueOrDefault<bool>(currentUserDocument?.isSeller, false))
                  Align(
                    alignment: AlignmentDirectional(0, 0.95),
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
                                child: BroadcastNameWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Broadcast',
                        icon: Icon(
                          Icons.videocam_rounded,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
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
