import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'channel_list_model.dart';
export 'channel_list_model.dart';

class ChannelListWidget extends StatefulWidget {
  const ChannelListWidget({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  _ChannelListWidgetState createState() => _ChannelListWidgetState();
}

class _ChannelListWidgetState extends State<ChannelListWidget> {
  late ChannelListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelListModel());

    _model.textController = TextEditingController();
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

    return StreamBuilder<List<ChannelsRecord>>(
      stream: queryChannelsRecord(
        queryBuilder: (channelsRecord) =>
            channelsRecord.orderBy('channel_created_on', descending: true),
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
        List<ChannelsRecord> channelListChannelsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final channelListChannelsRecord =
            channelListChannelsRecordList.isNotEmpty
                ? channelListChannelsRecordList.first
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
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  title: Text(
                    'Channels',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 15,
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
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: StreamBuilder<List<ChannelsRecord>>(
                          stream: queryChannelsRecord(
                            queryBuilder: (channelsRecord) => channelsRecord
                                .where('channel_status', isEqualTo: true)
                                .where('channel_name',
                                    isEqualTo: _model.textController.text != ''
                                        ? _model.textController.text
                                        : null),
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
                            List<ChannelsRecord> columnChannelsRecordList =
                                snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: List.generate(
                                    columnChannelsRecordList.length,
                                    (columnIndex) {
                                  final columnChannelsRecord =
                                      columnChannelsRecordList[columnIndex];
                                  return InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'channelDetails',
                                        queryParams: {
                                          'channelRef': serializeParam(
                                            columnChannelsRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
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
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, -1),
                                                  child: Container(
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xB3322F37),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 10, 0),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              child: StreamBuilder<
                                                                  List<
                                                                      StreamsRecord>>(
                                                                stream:
                                                                    queryStreamsRecord(
                                                                  queryBuilder: (streamsRecord) => streamsRecord
                                                                      .where(
                                                                          'channel_reference',
                                                                          arrayContains: columnChannelsRecord
                                                                              .reference)
                                                                      .where(
                                                                          'is_live',
                                                                          isEqualTo:
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
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<StreamsRecord>
                                                                      textStreamsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    formatNumber(
                                                                      functions.calcLiveViewrsChannel(
                                                                          textStreamsRecordList
                                                                              .toList(),
                                                                          -1,
                                                                          textStreamsRecordList
                                                                              .length),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).btnText,
                                                                          fontSize:
                                                                              12,
                                                                          letterSpacing:
                                                                              0.9,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  );
                                                                },
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                              ],
                                            ),
                                          ),
                                          if (columnChannelsRecord
                                                      .channelVideoUrl ==
                                                  null ||
                                              columnChannelsRecord
                                                      .channelVideoUrl ==
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 15),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.network(
                                                      valueOrDefault<String>(
                                                        columnChannelsRecord
                                                            .channelImage,
                                                        'https://i.seadn.io/gae/OGpebYaykwlc8Tbk-oGxtxuv8HysLYKqw-FurtYql2UBd_q_-ENAwDY82PkbNB68aTkCINn6tOhpA8pF5SAewC2auZ_44Q77PcOo870?auto=format&w=1920',
                                                      ),
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<StreamsRecord>>(
                                                  stream: queryStreamsRecord(
                                                    queryBuilder: (streamsRecord) => streamsRecord
                                                        .where(
                                                            'channel_reference',
                                                            arrayContains:
                                                                columnChannelsRecord
                                                                    .reference)
                                                        .orderBy(
                                                            'stream_view_online',
                                                            descending: true),
                                                    limit: 4,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<StreamsRecord>
                                                        gridViewStreamsRecordList =
                                                        snapshot.data!;
                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 4,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        childAspectRatio: 1,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          gridViewStreamsRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          gridViewIndex) {
                                                        final gridViewStreamsRecord =
                                                            gridViewStreamsRecordList[
                                                                gridViewIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 15),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (gridViewStreamsRecord
                                                                  .isLive!) {
                                                                context
                                                                    .pushNamed(
                                                                  'livestreamViewer',
                                                                  queryParams: {
                                                                    'url':
                                                                        serializeParam(
                                                                      gridViewStreamsRecord
                                                                          .playbackUrl,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'streamID':
                                                                        serializeParam(
                                                                      gridViewStreamsRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                _model.apiResultvaf =
                                                                    await GetLiveStreamIdCall
                                                                        .call(
                                                                  playbackId: functions
                                                                      .getPlaybackIdFromUrl(
                                                                          gridViewStreamsRecord
                                                                              .playbackUrl),
                                                                );
                                                                _model.apiResulto0b =
                                                                    await GetPastLiveStreamCall
                                                                        .call(
                                                                  streamId:
                                                                      GetLiveStreamIdCall
                                                                          .playBackID(
                                                                    (_model.apiResultvaf
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString(),
                                                                );

                                                                context
                                                                    .pushNamed(
                                                                  'livestreamViewer',
                                                                  queryParams: {
                                                                    'url':
                                                                        serializeParam(
                                                                      functions.createUrlFromPlayId(
                                                                          GetPastLiveStreamCall
                                                                              .playbackID(
                                                                        (_model.apiResulto0b?.jsonBody ??
                                                                            ''),
                                                                      ).toString()),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'streamID':
                                                                        serializeParam(
                                                                      gridViewStreamsRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }

                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 200,
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
                                                                      'https://image.mux.com/${gridViewStreamsRecord.streamId}/animated.webp?width=60&fps=5',
                                                                      'https://i.seadn.io/gae/OGpebYaykwlc8Tbk-oGxtxuv8HysLYKqw-FurtYql2UBd_q_-ENAwDY82PkbNB68aTkCINn6tOhpA8pF5SAewC2auZ_44Q77PcOo870?auto=format&w=1920',
                                                                    ),
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Container(
                                                                width: 15,
                                                                height: 15,
                                                                child: Stack(
                                                                  children: [
                                                                    if (gridViewStreamsRecord
                                                                            .isLive ??
                                                                        true)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.85,
                                                                            -0.85),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidCircle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor3,
                                                                          size:
                                                                              10,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
