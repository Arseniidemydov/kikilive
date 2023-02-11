import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_verification_model.dart';
export 'email_verification_model.dart';

class EmailVerificationWidget extends StatefulWidget {
  const EmailVerificationWidget({Key? key}) : super(key: key);

  @override
  _EmailVerificationWidgetState createState() =>
      _EmailVerificationWidgetState();
}

class _EmailVerificationWidgetState extends State<EmailVerificationWidget> {
  late EmailVerificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailVerificationModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: Color(0x2F1D2429),
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Verification',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFF1536D8),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Divider(
              height: 16,
              thickness: 2,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            Text(
              'Email Sent !',
              style: FlutterFlowTheme.of(context).subtitle1,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                'Please check your e-mail to verify you account with KIKI. \n( Check your spam in case your do not find it on your inbox)',
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
