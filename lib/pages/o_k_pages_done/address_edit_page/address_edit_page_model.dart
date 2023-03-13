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

class AddressEditPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  String? _txtNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;
  String? _txtPhoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtAddressLabel widget.
  TextEditingController? txtAddressLabelController;
  String? Function(BuildContext, String?)? txtAddressLabelControllerValidator;
  String? _txtAddressLabelControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtAddress1 widget.
  TextEditingController? txtAddress1Controller;
  String? Function(BuildContext, String?)? txtAddress1ControllerValidator;
  String? _txtAddress1ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtAddressline2 widget.
  TextEditingController? txtAddressline2Controller;
  String? Function(BuildContext, String?)? txtAddressline2ControllerValidator;
  String? _txtAddressline2ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtCity widget.
  TextEditingController? txtCityController;
  String? Function(BuildContext, String?)? txtCityControllerValidator;
  String? _txtCityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtZipcode widget.
  TextEditingController? txtZipcodeController;
  String? Function(BuildContext, String?)? txtZipcodeControllerValidator;
  String? _txtZipcodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNameControllerValidator = _txtNameControllerValidator;
    txtPhoneControllerValidator = _txtPhoneControllerValidator;
    txtAddressLabelControllerValidator = _txtAddressLabelControllerValidator;
    txtAddress1ControllerValidator = _txtAddress1ControllerValidator;
    txtAddressline2ControllerValidator = _txtAddressline2ControllerValidator;
    txtCityControllerValidator = _txtCityControllerValidator;
    txtZipcodeControllerValidator = _txtZipcodeControllerValidator;
  }

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
