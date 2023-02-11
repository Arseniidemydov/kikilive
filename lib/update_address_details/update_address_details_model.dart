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

class UpdateAddressDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtShipName widget.
  TextEditingController? txtShipNameController;
  String? Function(BuildContext, String?)? txtShipNameControllerValidator;
  String? _txtShipNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for txtShipPhone widget.
  TextEditingController? txtShipPhoneController;
  String? Function(BuildContext, String?)? txtShipPhoneControllerValidator;
  String? _txtShipPhoneControllerValidator(BuildContext context, String? val) {
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
    txtShipNameControllerValidator = _txtShipNameControllerValidator;
    txtShipPhoneControllerValidator = _txtShipPhoneControllerValidator;
    txtAddressLabelControllerValidator = _txtAddressLabelControllerValidator;
    txtAddressControllerValidator = _txtAddressControllerValidator;
    txtCityControllerValidator = _txtCityControllerValidator;
    txtZipControllerValidator = _txtZipControllerValidator;
  }

  void dispose() {
    txtShipNameController?.dispose();
    txtShipPhoneController?.dispose();
    txtAddressLabelController?.dispose();
    txtAddressController?.dispose();
    txtAddress2Controller?.dispose();
    txtCityController?.dispose();
    txtZipController?.dispose();
  }

  /// Additional helper methods are added here.

}
