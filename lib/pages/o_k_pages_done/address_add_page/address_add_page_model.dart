import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressAddPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;
  // State field(s) for txtAddressLabel widget.
  TextEditingController? txtAddressLabelController;
  String? Function(BuildContext, String?)? txtAddressLabelControllerValidator;
  // State field(s) for txtAddress1 widget.
  TextEditingController? txtAddress1Controller;
  String? Function(BuildContext, String?)? txtAddress1ControllerValidator;
  // State field(s) for txtAddressline2 widget.
  TextEditingController? txtAddressline2Controller;
  String? Function(BuildContext, String?)? txtAddressline2ControllerValidator;
  // State field(s) for txtCity widget.
  TextEditingController? txtCityController;
  String? Function(BuildContext, String?)? txtCityControllerValidator;
  // State field(s) for txtZipcode widget.
  TextEditingController? txtZipcodeController;
  String? Function(BuildContext, String?)? txtZipcodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtNameController?.dispose();
    txtPhoneController?.dispose();
    txtAddressLabelController?.dispose();
    txtAddress1Controller?.dispose();
    txtAddressline2Controller?.dispose();
    txtCityController?.dispose();
    txtZipcodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
