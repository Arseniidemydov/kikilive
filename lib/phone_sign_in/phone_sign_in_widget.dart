import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_sign_in_model.dart';
export 'phone_sign_in_model.dart';

class PhoneSignInWidget extends StatefulWidget {
  const PhoneSignInWidget({Key? key}) : super(key: key);

  @override
  _PhoneSignInWidgetState createState() => _PhoneSignInWidgetState();
}

class _PhoneSignInWidgetState extends State<PhoneSignInWidget>
    with TickerProviderStateMixin {
  late PhoneSignInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneSignInModel());

    _model.phoneNumberController = TextEditingController();
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 20),
                  child: Text(
                    'Type in your phone number \nbelow to register.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 2, 0, 2),
                      child: FlutterFlowDropDown<String>(
                        initialOption: _model.dropDownValue ??= '+66',
                        options: ['+91', '+66', '+55'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: 50,
                        height: 50,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        hintText: 'Code',
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 0,
                        ),
                        elevation: 2,
                        borderColor: Color(0x0049454F),
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: TextFormField(
                          controller: _model.phoneNumberController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                    ),
                            hintText: 'Eg: 987654321',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(5, 24, 20, 24),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          minLines: 1,
                          keyboardType: TextInputType.phone,
                          validator: _model.phoneNumberControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final phoneNumberVal =
                    '${_model.dropDownValue}${_model.phoneNumberController.text}';
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

                FFAppState().update(() {
                  FFAppState().verifyNumber =
                      '${_model.dropDownValue}${_model.phoneNumberController.text}';
                });
              },
              text: 'Sign In with Phone',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      fontSize: 15,
                    ),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: InkWell(
              onTap: () async {
                context.pop();
              },
              child: Text(
                'Go back',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
