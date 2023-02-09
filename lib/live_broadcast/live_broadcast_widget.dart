import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/cloud_functions/cloud_functions.dart';
import '../components/product_pop_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_mux_broadcast.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class LiveBroadcastWidget extends StatefulWidget {
  const LiveBroadcastWidget({
    Key? key,
    this.videoName,
    this.channelRef,
  }) : super(key: key);

  final String? videoName;
  final List<DocumentReference>? channelRef;

  @override
  _LiveBroadcastWidgetState createState() => _LiveBroadcastWidgetState();
}

class _LiveBroadcastWidgetState extends State<LiveBroadcastWidget> {
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  bool _isSupportedPlatform = false;
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;
  ApiCallResponse? apiResult1;
  StreamsRecord? liveOutput2;
  ApiCallResponse? apiResult2;
  PagingController<DocumentSnapshot?, StreamingCommentsRecord>?
      _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid || Platform.isIOS) {
      _isSupportedPlatform = true;
      _initCamera();
    }

    textController = TextEditingController();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    Wakelock.disable();

    _streamSubscriptions.forEach((s) => s?.cancel());
    textController?.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Stack(
                        children: [
                          FlutterFlowMuxBroadcast(
                            isCameraInitialized: _isCameraInitialized,
                            isStreaming: muxBroadcastIsLive,
                            durationString: _durationString,
                            borderRadius: BorderRadius.circular(0),
                            controller: muxBroadcastController,
                            videoConfig: _initialVideoConfig,
                            onCameraRotateButtonTap: () async {
                              await switchCamera();
                              setState(() =>
                                  _isFrontCamSelected = !_isFrontCamSelected);
                            },
                            startButtonText: 'Start Stream',
                            startButtonIcon: Icon(
                              Icons.videocam_sharp,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 20,
                            ),
                            startButtonOptions: FFButtonOptions(
                              width: 160,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontSize: 14,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            liveIcon: FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: FlutterFlowTheme.of(context).customColor3,
                              size: 10,
                            ),
                            liveText: 'Live',
                            liveTextStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.red,
                                    ),
                            liveTextBackgroundColor: Color(0x8A000000),
                            durationTextStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                            durationTextBackgroundColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            liveContainerBorderRadius: BorderRadius.circular(8),
                            durationContainerBorderRadius:
                                BorderRadius.circular(8),
                            rotateButtonColor: Color(0x8A000000),
                            rotateButtonIcon: Icon(
                              Icons.flip_camera_android,
                              color: Colors.white,
                              size: 24,
                            ),
                            stopButtonIcon: Icon(
                              Icons.stop_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            stopButtonColor: Colors.red,
                            onStartButtonTap: () async {
                              await startStreaming();

                              final streamsCreateData = {
                                ...createStreamsRecordData(
                                  isLive: true,
                                  playbackName: widget.videoName,
                                  playbackUrl: muxBroadcastPlaybackUrl,
                                  timestamp: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                  streamViewOnline: 1,
                                  streamViewOffline: 1,
                                ),
                                'channel_reference': widget.channelRef,
                              };
                              var streamsRecordReference =
                                  StreamsRecord.collection.doc();
                              await streamsRecordReference
                                  .set(streamsCreateData);
                              liveOutput2 = StreamsRecord.getDocumentFromData(
                                  streamsCreateData, streamsRecordReference);
                              apiResult1 = await GetLiveStreamIdCall.call(
                                playbackId: functions.getPlaybackIdFromUrl(
                                    liveOutput2!.playbackUrl),
                              );
                              apiResult2 = await GetPastLiveStreamCall.call(
                                streamId: GetLiveStreamIdCall.playBackID(
                                  (apiResult1?.jsonBody ?? ''),
                                ).toString(),
                              );

                              final streamsUpdateData = createStreamsRecordData(
                                streamId: GetPastLiveStreamCall.playbackID(
                                  (apiResult2?.jsonBody ?? ''),
                                ).toString(),
                              );
                              await liveOutput2!.reference
                                  .update(streamsUpdateData);

                              setState(() {});
                            },
                            onStopButtonTap: () async {
                              stopStreaming();

                              final streamsUpdateData = createStreamsRecordData(
                                isLive: false,
                                streamViewOnline: 0,
                              );
                              await liveOutput2!.reference
                                  .update(streamsUpdateData);
                              context.pop();
                            },
                          ),
                          if (FFAppState().chatOpen)
                            Align(
                              alignment: AlignmentDirectional(0, 0.95),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 16),
                                child: StreamBuilder<StreamsRecord>(
                                  stream: StreamsRecord.getDocument(
                                      liveOutput2!.reference),
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
                                    final containerStreamsRecord =
                                        snapshot.data!;
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .backgroundChat,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: PagedListView<
                                                      DocumentSnapshot<
                                                          Object?>?,
                                                      StreamingCommentsRecord>(
                                                    pagingController: () {
                                                      final Query<Object?> Function(
                                                              Query<Object?>)
                                                          queryBuilder =
                                                          (streamingCommentsRecord) =>
                                                              streamingCommentsRecord
                                                                  .where(
                                                                      'streamID',
                                                                      isEqualTo:
                                                                          containerStreamsRecord
                                                                              .reference)
                                                                  .orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true);
                                                      if (_pagingController !=
                                                          null) {
                                                        final query = queryBuilder(
                                                            StreamingCommentsRecord
                                                                .collection);
                                                        if (query !=
                                                            _pagingQuery) {
                                                          // The query has changed
                                                          _pagingQuery = query;
                                                          _streamSubscriptions
                                                              .forEach((s) =>
                                                                  s?.cancel());
                                                          _streamSubscriptions
                                                              .clear();
                                                          _pagingController!
                                                              .refresh();
                                                        }
                                                        return _pagingController!;
                                                      }

                                                      _pagingController =
                                                          PagingController(
                                                              firstPageKey:
                                                                  null);
                                                      _pagingQuery = queryBuilder(
                                                          StreamingCommentsRecord
                                                              .collection);
                                                      _pagingController!
                                                          .addPageRequestListener(
                                                              (nextPageMarker) {
                                                        queryStreamingCommentsRecordPage(
                                                          queryBuilder: (streamingCommentsRecord) =>
                                                              streamingCommentsRecord
                                                                  .where(
                                                                      'streamID',
                                                                      isEqualTo:
                                                                          containerStreamsRecord
                                                                              .reference)
                                                                  .orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true),
                                                          nextPageMarker:
                                                              nextPageMarker,
                                                          pageSize: 25,
                                                          isStream: true,
                                                        ).then((page) {
                                                          _pagingController!
                                                              .appendPage(
                                                            page.data,
                                                            page.nextPageMarker,
                                                          );
                                                          final streamSubscription =
                                                              page.dataStream
                                                                  ?.listen(
                                                                      (data) {
                                                            data.forEach(
                                                                (item) {
                                                              final itemIndexes =
                                                                  _pagingController!
                                                                      .itemList!
                                                                      .asMap()
                                                                      .map((k, v) => MapEntry(
                                                                          v.reference
                                                                              .id,
                                                                          k));
                                                              final index =
                                                                  itemIndexes[item
                                                                      .reference
                                                                      .id];
                                                              final items =
                                                                  _pagingController!
                                                                      .itemList!;
                                                              if (index !=
                                                                  null) {
                                                                items
                                                                    .replaceRange(
                                                                        index,
                                                                        index +
                                                                            1,
                                                                        [item]);
                                                                _pagingController!
                                                                    .itemList = {
                                                                  for (var item
                                                                      in items)
                                                                    item.reference:
                                                                        item
                                                                }
                                                                    .values
                                                                    .toList();
                                                              }
                                                            });
                                                            setState(() {});
                                                          });
                                                          _streamSubscriptions.add(
                                                              streamSubscription);
                                                        });
                                                      });
                                                      return _pagingController!;
                                                    }(),
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    builderDelegate:
                                                        PagedChildBuilderDelegate<
                                                            StreamingCommentsRecord>(
                                                      // Customize what your widget looks like when it's loading the first page.
                                                      firstPageProgressIndicatorBuilder:
                                                          (_) => Center(
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
                                                      ),
                                                      noItemsFoundIndicatorBuilder:
                                                          (_) => Image.asset(
                                                        'assets/images/Sem_ttulo.png',
                                                      ),
                                                      itemBuilder: (context, _,
                                                          listViewIndex) {
                                                        final listViewStreamingCommentsRecord =
                                                            _pagingController!
                                                                    .itemList![
                                                                listViewIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 5),
                                                          child: StreamBuilder<
                                                              UsersRecord>(
                                                            stream: UsersRecord
                                                                .getDocument(
                                                                    listViewStreamingCommentsRecord
                                                                        .userID!),
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
                                                              final rowUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        rowUsersRecord
                                                                            .photoUrl,
                                                                        'https://picsum.photos/seed/725/600',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            rowUsersRecord.displayName!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listViewStreamingCommentsRecord.comment!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller:
                                                          textController,
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        final streamingCommentsCreateData =
                                                            createStreamingCommentsRecordData(
                                                          streamID: liveOutput2!
                                                              .reference,
                                                          comment:
                                                              textController!
                                                                  .text,
                                                          userID:
                                                              currentUserReference,
                                                          createdAt:
                                                              getCurrentTimestamp,
                                                        );
                                                        await StreamingCommentsRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                streamingCommentsCreateData);
                                                      },
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Chat',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        suffixIcon: Icon(
                                                          Icons.send_sharp,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22,
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                              ),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .shoppingBasket,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 16,
                                                    ),
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.7,
                                                              child:
                                                                  ProductPopWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
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
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.94, -0.77),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              icon: Icon(
                                Icons.chat_bubble_outline_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                size: 20,
                              ),
                              onPressed: () async {
                                if (FFAppState().chatOpen) {
                                  FFAppState().update(() {
                                    FFAppState().chatOpen = false;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().chatOpen = true;
                                  });
                                }
                              },
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
        ),
      ),
    );
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    setState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        setState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        if (mounted) setState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        if (mounted) setState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    final callName = 'createLiveStream';
    final response = await makeCloudCall(callName, {});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        Wakelock.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      Wakelock.disable();
      liveStreamController.stopStreaming();
      if (mounted) setState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _durationString = _getDurationString(_stopwatch.elapsed);
        });
      }
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
