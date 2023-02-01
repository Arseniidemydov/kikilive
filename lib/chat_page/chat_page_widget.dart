import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ChatMessagesRecord>>(
      stream: queryChatMessagesRecord(
        queryBuilder: (chatMessagesRecord) => chatMessagesRecord
            .where('chat', isEqualTo: widget.chatRef)
            .orderBy('timestamp', descending: true),
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
        List<ChatMessagesRecord> chatPageChatMessagesRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
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
                  title: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Group Chat',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Icon(
                        Icons.chat,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24,
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 2,
                )
              : null,
          body: SafeArea(
            child: StreamBuilder<FFChatInfo>(
              stream: FFChatManager.instance.getChatInfo(
                otherUserRecord: widget.chatUser,
                chatReference: widget.chatRef,
              ),
              builder: (context, snapshot) => snapshot.hasData
                  ? FFChatPage(
                      chatInfo: snapshot.data!,
                      allowImages: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                      currentUserBoxDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      otherUsersBoxDecoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      currentUserTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Color(0xFF1E2429),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                      ),
                      otherUsersTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      inputHintTextStyle: GoogleFonts.getFont(
                        'Roboto',
                        color: Color(0xFF95A1AC),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      inputTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    )
                  : Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
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
