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

class CartAddressModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtUser widget.
  TextEditingController? txtUserController;
  String? Function(BuildContext, String?)? txtUserControllerValidator;
  String? _txtUserControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
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

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }
    if (val.length > 13) {
      return 'Maximum 13 characters allowed, currently ${val.length}.';
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

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for txtAddress widget.
  TextEditingController? txtAddressController;
  String? Function(BuildContext, String?)? txtAddressControllerValidator;
  String? _txtAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for txtAddress2 widget.
  TextEditingController? txtAddress2Controller;
  String? Function(BuildContext, String?)? txtAddress2ControllerValidator;
  String? _txtAddress2ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
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

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for txtZip widget.
  TextEditingController? txtZipController;
  String? Function(BuildContext, String?)? txtZipControllerValidator;
  String? _txtZipControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtUserControllerValidator = _txtUserControllerValidator;
    txtPhoneControllerValidator = _txtPhoneControllerValidator;
    txtAddressLabelControllerValidator = _txtAddressLabelControllerValidator;
    txtAddressControllerValidator = _txtAddressControllerValidator;
    txtAddress2ControllerValidator = _txtAddress2ControllerValidator;
    txtCityControllerValidator = _txtCityControllerValidator;
    txtZipControllerValidator = _txtZipControllerValidator;
  }

  void dispose() {
    txtUserController?.dispose();
    txtPhoneController?.dispose();
    txtAddressLabelController?.dispose();
    txtAddressController?.dispose();
    txtAddress2Controller?.dispose();
    txtCityController?.dispose();
    txtZipController?.dispose();
  }

  /// Additional helper methods are added here.

}
