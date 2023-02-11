import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_o_t_p_model.dart';
export 'verify_o_t_p_model.dart';

class VerifyOTPWidget extends StatefulWidget {
  const VerifyOTPWidget({Key? key}) : super(key: key);

  @override
  _VerifyOTPWidgetState createState() => _VerifyOTPWidgetState();
}

class _VerifyOTPWidgetState extends State<VerifyOTPWidget> {
  late VerifyOTPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyOTPModel());
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Confirm your Code',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                    child: Text(
                      'This code helps keep your account safe and secure.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 0),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: true,
                      showCursor: true,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      obscureText: false,
                      pinTheme: PinTheme(
                        fieldHeight: 64,
                        fieldWidth: 50,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(12),
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).tertiary400,
                        inactiveColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        selectedColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        activeFillColor:
                            FlutterFlowTheme.of(context).tertiary400,
                        inactiveFillColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        selectedFillColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (_) => {},
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                final phoneNumberVal = FFAppState().verifyNumber;
                if (phoneNumberVal == null ||
                    phoneNumberVal.isEmpty ||
                    !phoneNumberVal.startsWith('+')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Phone Number is required and has to start with +.'),
                    ),
                  );
                  return;
                }
                await beginPhoneAuth(
                  context: context,
                  phoneNumber: phoneNumberVal,
                  onCodeSent: () async {
                    context.goNamedAuth(
                      'verifyOTP',
                      mounted,
                      ignoreRedirect: true,
                    );
                  },
                );
              },
              child: Text(
                'Resend code',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 44),
              child: FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  final smsCodeVal = _model.pinCodeController!.text;
                  if (smsCodeVal == null || smsCodeVal.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter SMS verification code.'),
                      ),
                    );
                    return;
                  }
                  final phoneVerifiedUser = await verifySmsCode(
                    context: context,
                    smsCode: smsCodeVal,
                  );
                  if (phoneVerifiedUser == null) {
                    return;
                  }

                  context.pushNamedAuth('Products', mounted);
                },
                text: 'Confirm & Continue',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).secondaryColor,
                      ),
                  elevation: 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
