import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/live_card/live_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'channel_detaisl_page_model.dart';
export 'channel_detaisl_page_model.dart';

class ChannelDetaislPageWidget extends StatefulWidget {
  const ChannelDetaislPageWidget({
    Key? key,
    this.channelRef,
  }) : super(key: key);

  final DocumentReference? channelRef;

  @override
  _ChannelDetaislPageWidgetState createState() =>
      _ChannelDetaislPageWidgetState();
}

class _ChannelDetaislPageWidgetState extends State<ChannelDetaislPageWidget> {
  late ChannelDetaislPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelDetaislPageModel());
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

    return StreamBuilder<ChannelsRecord>(
      stream: ChannelsRecord.getDocument(widget.channelRef!),
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
        final channelDetaislPageChannelsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Visibility(
            visible: channelDetaislPageChannelsRecord.channelMembers!
                .toList()
                .contains(currentUserReference),
            child: StreamBuilder<List<ChatsRecord>>(
              stream: queryChatsRecord(
                queryBuilder: (chatsRecord) => chatsRecord
                    .where('ChannelRef', isEqualTo: widget.channelRef)
                    .where('users', arrayContains: currentUserReference),
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
                List<ChatsRecord> floatingActionButtonChatsRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final floatingActionButtonChatsRecord =
                    floatingActionButtonChatsRecordList.isNotEmpty
                        ? floatingActionButtonChatsRecordList.first
                        : null;
                return FloatingActionButton(
                  onPressed: () async {
                    context.pushNamed(
                      'chat_page',
                      queryParams: {
                        'chatRef': serializeParam(
                          floatingActionButtonChatsRecord!.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  elevation: 8.0,
                  child: Icon(
                    Icons.chat,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 24.0,
                  ),
                );
              },
            ),
          ),
          appBar: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
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
                      context.pop();
                    },
                  ),
                  title: Text(
                    channelDetaislPageChannelsRecord.channelName!,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0.0,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                valueOrDefault<String>(
                                  channelDetaislPageChannelsRecord.channelImage,
                                  'https://i.seadn.io/gae/OGpebYaykwlc8Tbk-oGxtxuv8HysLYKqw-FurtYql2UBd_q_-ENAwDY82PkbNB68aTkCINn6tOhpA8pF5SAewC2auZ_44Q77PcOo870?auto=format&w=1920',
                                ),
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              channelDetaislPageChannelsRecord.channelName!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 20.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Container(
                                        height: 28.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xB3322F37),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.solidCircle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor3,
                                                  size: 12.0,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.05),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<StreamsRecord>>(
                                                    stream: queryStreamsRecord(
                                                      queryBuilder: (streamsRecord) =>
                                                          streamsRecord
                                                              .where(
                                                                  'stream_channel_reference',
                                                                  arrayContains:
                                                                      widget
                                                                          .channelRef)
                                                              .where('is_live',
                                                                  isEqualTo:
                                                                      true),
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
                                                      List<StreamsRecord>
                                                          textStreamsRecordList =
                                                          snapshot.data!;
                                                      return Text(
                                                        formatNumber(
                                                          functions.calcLiveViewersChannel(
                                                              textStreamsRecordList
                                                                  .toList(),
                                                              -1,
                                                              textStreamsRecordList
                                                                  .length),
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .btnText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.05),
                                                child: Text(
                                                  'Viewers',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .btnText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.9,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            channelDetaislPageChannelsRecord
                                                .channelPrice!
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          Text(
                                            '/',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              'Month',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                          StreamBuilder<List<ChatsRecord>>(
                                            stream: queryChatsRecord(
                                              queryBuilder: (chatsRecord) =>
                                                  chatsRecord.where(
                                                      'ChannelRef',
                                                      isEqualTo:
                                                          widget.channelRef),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChatsRecord>
                                                  buttonChatsRecordList =
                                                  snapshot.data!;
                                              final buttonChatsRecord =
                                                  buttonChatsRecordList
                                                          .isNotEmpty
                                                      ? buttonChatsRecordList
                                                          .first
                                                      : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  if (channelDetaislPageChannelsRecord
                                                          .channelPrice! >
                                                      0.0) {
                                                    if (channelDetaislPageChannelsRecord
                                                        .channelMembers!
                                                        .toList()
                                                        .contains(
                                                            currentUserReference)) {
                                                      final channelsUpdateData1 =
                                                          {
                                                        'channel_members':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await widget.channelRef!
                                                          .update(
                                                              channelsUpdateData1);

                                                      final chatsUpdateData1 = {
                                                        'users': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await buttonChatsRecord!
                                                          .reference
                                                          .update(
                                                              chatsUpdateData1);
                                                    } else {
                                                      final paymentResponse =
                                                          await processStripePayment(
                                                        context,
                                                        amount: functions
                                                            .stripeAmountPayNewCart(
                                                                0.0,
                                                                channelDetaislPageChannelsRecord
                                                                    .channelPrice!)!
                                                            .round(),
                                                        currency: 'THB',
                                                        customerEmail:
                                                            currentUserEmail,
                                                        customerName:
                                                            currentUserDisplayName,
                                                        description:
                                                            'Channel Join',
                                                        allowGooglePay: false,
                                                        allowApplePay: false,
                                                      );
                                                      if (paymentResponse
                                                              .paymentId ==
                                                          null) {
                                                        if (paymentResponse
                                                                .errorMessage !=
                                                            null) {
                                                          showSnackbar(
                                                            context,
                                                            'Error: ${paymentResponse.errorMessage}',
                                                          );
                                                        }
                                                        return;
                                                      }
                                                      _model.paymentIdChannel =
                                                          paymentResponse
                                                              .paymentId!;

                                                      if (_model
                                                              .paymentIdChannel !=
                                                          '') {
                                                        final channelsUpdateData2 =
                                                            {
                                                          'channel_members':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await widget.channelRef!
                                                            .update(
                                                                channelsUpdateData2);

                                                        final chatsUpdateData2 =
                                                            {
                                                          'users': FieldValue
                                                              .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await buttonChatsRecord!
                                                            .reference
                                                            .update(
                                                                chatsUpdateData2);

                                                        final channelJoinPaymentCreateData =
                                                            createChannelJoinPaymentRecordData(
                                                          channelJoinAt:
                                                              getCurrentTimestamp,
                                                          channelJoinUserReference:
                                                              currentUserReference,
                                                          channelJoinReference:
                                                              widget.channelRef,
                                                          channelJoinPaymentId:
                                                              _model
                                                                  .paymentIdChannel,
                                                        );
                                                        await ChannelJoinPaymentRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                channelJoinPaymentCreateData);
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Payment Error'),
                                                              content: Text(
                                                                  'We could not process your payment. Try Again!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }
                                                  } else {
                                                    if (channelDetaislPageChannelsRecord
                                                        .channelMembers!
                                                        .toList()
                                                        .contains(
                                                            currentUserReference)) {
                                                      final channelsUpdateData3 =
                                                          {
                                                        'channel_members':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await widget.channelRef!
                                                          .update(
                                                              channelsUpdateData3);

                                                      final chatsUpdateData3 = {
                                                        'users': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await buttonChatsRecord!
                                                          .reference
                                                          .update(
                                                              chatsUpdateData3);
                                                    } else {
                                                      final channelsUpdateData4 =
                                                          {
                                                        'channel_members':
                                                            FieldValue
                                                                .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await widget.channelRef!
                                                          .update(
                                                              channelsUpdateData4);

                                                      final chatsUpdateData4 = {
                                                        'users': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await buttonChatsRecord!
                                                          .reference
                                                          .update(
                                                              chatsUpdateData4);
                                                    }
                                                  }

                                                  context.pushNamed(
                                                    'channel_detaisl_page',
                                                    queryParams: {
                                                      'channelRef':
                                                          serializeParam(
                                                        widget.channelRef,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  setState(() {});
                                                },
                                                text: channelDetaislPageChannelsRecord
                                                        .channelMembers!
                                                        .toList()
                                                        .contains(
                                                            currentUserReference)
                                                    ? 'Leave'
                                                    : 'Join',
                                                options: FFButtonOptions(
                                                  width: 60.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        fontSize: 12.0,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
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
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 2.0, 2.0),
                                child: Text(
                                  channelDetaislPageChannelsRecord
                                      .channelDescription!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FutureBuilder<List<StreamsRecord>>(
                            future: (_model.firestoreRequestCompleter ??=
                                    Completer<List<StreamsRecord>>()
                                      ..complete(queryStreamsRecordOnce(
                                        queryBuilder: (streamsRecord) =>
                                            streamsRecord
                                                .where(
                                                    'stream_channel_reference',
                                                    arrayContains:
                                                        widget.channelRef)
                                                .orderBy('stream_view_online',
                                                    descending: true),
                                      )))
                                .future,
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
                              List<StreamsRecord> listViewStreamsRecordList =
                                  snapshot.data!;
                              return RefreshIndicator(
                                onRefresh: () async {
                                  setState(() =>
                                      _model.firestoreRequestCompleter = null);
                                  await _model
                                      .waitForFirestoreRequestCompleter();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewStreamsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewStreamsRecord =
                                        listViewStreamsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 15.0, 15.0, 15.0),
                                      child: LiveCardWidget(
                                        key: Key(
                                            'Key2p5_${listViewIndex}_of_${listViewStreamsRecordList.length}'),
                                        streamRef:
                                            listViewStreamsRecord.reference,
                                      ),
                                    );
                                  },
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
          ),
        );
      },
    );
  }
}
