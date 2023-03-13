import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/components/product_pop_up_live/product_pop_up_live_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_mux_broadcast.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'live_broadcaster_page_model.dart';
export 'live_broadcaster_page_model.dart';

class LiveBroadcasterPageWidget extends StatefulWidget {
  const LiveBroadcasterPageWidget({
    Key? key,
    this.videoName,
    this.channelRef,
  }) : super(key: key);

  final String? videoName;
  final List<DocumentReference>? channelRef;

  @override
  _LiveBroadcasterPageWidgetState createState() =>
      _LiveBroadcasterPageWidgetState();
}

class _LiveBroadcasterPageWidgetState extends State<LiveBroadcasterPageWidget> {
  late LiveBroadcasterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveBroadcasterPageModel());

    if (Platform.isAndroid || Platform.isIOS) {
      _isSupportedPlatform = true;
      _initCamera();
    }

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    _stopwatch.stop();
    _timer?.cancel();
    Wakelock.disable();

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
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: Stack(
                          children: [
                            FlutterFlowMuxBroadcast(
                              isCameraInitialized: _isCameraInitialized,
                              isStreaming: muxBroadcastIsLive,
                              durationString: _durationString,
                              borderRadius: BorderRadius.circular(0.0),
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
                                size: 20.0,
                              ),
                              startButtonOptions: FFButtonOptions(
                                width: 160.0,
                                height: 50.0,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      fontSize: 14.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              liveIcon: FaIcon(
                                FontAwesomeIcons.solidCircle,
                                color:
                                    FlutterFlowTheme.of(context).customColor3,
                                size: 10.0,
                              ),
                              liveText: 'Live',
                              liveTextStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.red,
                                  ),
                              liveTextBackgroundColor: Color(0x8A000000),
                              durationTextStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                  ),
                              durationTextBackgroundColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              liveContainerBorderRadius:
                                  BorderRadius.circular(8.0),
                              durationContainerBorderRadius:
                                  BorderRadius.circular(8.0),
                              rotateButtonColor: Color(0x8A000000),
                              rotateButtonIcon: Icon(
                                Icons.flip_camera_android,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              stopButtonIcon: Icon(
                                Icons.stop_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              stopButtonColor: Colors.red,
                              onStartButtonTap: () async {
                                await startStreaming();

                                final streamsCreateData = {
                                  ...createStreamsRecordData(
                                    isLive: true,
                                    playbackName: widget.videoName,
                                    playbackUrl: muxBroadcastPlaybackUrl,
                                    streamViewOnline: 1,
                                    streamViewOffline: 1,
                                    streamUserReference: currentUserReference,
                                    createdAt: getCurrentTimestamp,
                                  ),
                                  'stream_channel_reference': widget.channelRef,
                                };
                                var streamsRecordReference =
                                    StreamsRecord.collection.doc();
                                await streamsRecordReference
                                    .set(streamsCreateData);
                                _model.liveOutput2 =
                                    StreamsRecord.getDocumentFromData(
                                        streamsCreateData,
                                        streamsRecordReference);
                                await Future.delayed(
                                    const Duration(milliseconds: 20000));
                                _model.apiResult1 =
                                    await GetLiveStreamIdCall.call(
                                  playbackId: functions.getPlaybackIdFromUrl(
                                      _model.liveOutput2!.playbackUrl),
                                );
                                _model.apiResult2 =
                                    await GetPastLiveStreamCall.call(
                                  streamId: GetLiveStreamIdCall.playBackID(
                                    (_model.apiResult1?.jsonBody ?? ''),
                                  ).toString(),
                                );

                                final streamsUpdateData =
                                    createStreamsRecordData(
                                  streamId: GetPastLiveStreamCall.playbackID(
                                    (_model.apiResult2?.jsonBody ?? ''),
                                  ).toString(),
                                );
                                await _model.liveOutput2!.reference
                                    .update(streamsUpdateData);

                                setState(() {});
                              },
                              onStopButtonTap: () async {
                                stopStreaming();

                                final streamsUpdateData =
                                    createStreamsRecordData(
                                  isLive: false,
                                  streamViewOnline: 0,
                                );
                                await _model.liveOutput2!.reference
                                    .update(streamsUpdateData);
                                context.safePop();
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.94, -0.77),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.chat_bubble_outline_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  size: 20.0,
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
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (FFAppState().chatOpen)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.95),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 16.0),
                          child: StreamBuilder<StreamsRecord>(
                            stream: StreamsRecord.getDocument(
                                _model.liveOutput2!.reference),
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
                              final containerStreamsRecord = snapshot.data!;
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .backgroundChat,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: StreamBuilder<
                                                List<StreamsCommentsRecord>>(
                                              stream:
                                                  queryStreamsCommentsRecord(
                                                queryBuilder: (streamsCommentsRecord) =>
                                                    streamsCommentsRecord
                                                        .where(
                                                            'stream_reference',
                                                            isEqualTo:
                                                                containerStreamsRecord
                                                                    .reference)
                                                        .orderBy('created_at',
                                                            descending: true),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<StreamsCommentsRecord>
                                                    listViewStreamsCommentsRecordList =
                                                    snapshot.data!;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  reverse: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewStreamsCommentsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewStreamsCommentsRecord =
                                                        listViewStreamsCommentsRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord.getDocument(
                                                            listViewStreamsCommentsRecord
                                                                .streamUserReference!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          final rowUsersRecord =
                                                              snapshot.data!;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
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
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        rowUsersRecord
                                                                            .displayName!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        listViewStreamsCommentsRecord
                                                                            .streamComment!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontSize: 12.0,
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
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                onFieldSubmitted: (_) async {
                                                  final streamsCommentsCreateData =
                                                      createStreamsCommentsRecordData(
                                                    createdAt:
                                                        getCurrentTimestamp,
                                                    streamReference:
                                                        containerStreamsRecord
                                                            .reference,
                                                    streamComment: _model
                                                        .textController.text,
                                                    streamUserReference:
                                                        currentUserReference,
                                                  );
                                                  await StreamsCommentsRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          streamsCommentsCreateData);
                                                },
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Chat',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  suffixIcon: Icon(
                                                    Icons.send_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    size: 22.0,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                        ),
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: FaIcon(
                                                FontAwesomeIcons.shoppingBasket,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 16.0,
                                              ),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                        child:
                                                            ProductPopUpLiveWidget(
                                                          userID: containerStreamsRecord
                                                              .streamUserReference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
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
                  ],
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
