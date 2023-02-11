import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SellerApprovalModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtDisplayName widget.
  TextEditingController? txtDisplayNameController;
  String? Function(BuildContext, String?)? txtDisplayNameControllerValidator;
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController1;
  String? Function(BuildContext, String?)? txtPhoneController1Validator;
  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController2;
  String? Function(BuildContext, String?)? txtPhoneController2Validator;
  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController3;
  String? Function(BuildContext, String?)? txtPhoneController3Validator;
  // State field(s) for txtCity widget.
  TextEditingController? txtCityController;
  String? Function(BuildContext, String?)? txtCityControllerValidator;
  // State field(s) for txtzipcode widget.
  TextEditingController? txtzipcodeController;
  String? Function(BuildContext, String?)? txtzipcodeControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtDisplayNameController?.dispose();
    txtEmailController?.dispose();
    txtPhoneController1?.dispose();
    txtPhoneController2?.dispose();
    txtPhoneController3?.dispose();
    txtCityController?.dispose();
    txtzipcodeController?.dispose();
    textController8?.dispose();
  }

  /// Additional helper methods are added here.

}
