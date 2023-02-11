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

class SellersDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  String? _txtNameControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  String? _txtEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
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

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
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

  // State field(s) for txtZipcode widget.
  TextEditingController? txtZipcodeController;
  String? Function(BuildContext, String?)? txtZipcodeControllerValidator;
  String? _txtZipcodeControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for txtshippingFee widget.
  TextEditingController? txtshippingFeeController;
  String? Function(BuildContext, String?)? txtshippingFeeControllerValidator;
  String? _txtshippingFeeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for txtInsta widget.
  TextEditingController? txtInstaController;
  String? Function(BuildContext, String?)? txtInstaControllerValidator;
  // State field(s) for txtLine widget.
  TextEditingController? txtLineController;
  String? Function(BuildContext, String?)? txtLineControllerValidator;
  // State field(s) for txtbank widget.
  TextEditingController? txtbankController;
  String? Function(BuildContext, String?)? txtbankControllerValidator;
  String? _txtbankControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for txtbankAccount widget.
  TextEditingController? txtbankAccountController;
  String? Function(BuildContext, String?)? txtbankAccountControllerValidator;
  String? _txtbankAccountControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNameControllerValidator = _txtNameControllerValidator;
    txtPhoneControllerValidator = _txtPhoneControllerValidator;
    txtEmailControllerValidator = _txtEmailControllerValidator;
    txtAddress1ControllerValidator = _txtAddress1ControllerValidator;
    txtAddressline2ControllerValidator = _txtAddressline2ControllerValidator;
    txtCityControllerValidator = _txtCityControllerValidator;
    txtZipcodeControllerValidator = _txtZipcodeControllerValidator;
    txtshippingFeeControllerValidator = _txtshippingFeeControllerValidator;
    txtbankControllerValidator = _txtbankControllerValidator;
    txtbankAccountControllerValidator = _txtbankAccountControllerValidator;
  }

  void dispose() {
    txtNameController?.dispose();
    txtPhoneController?.dispose();
    txtEmailController?.dispose();
    txtAddress1Controller?.dispose();
    txtAddressline2Controller?.dispose();
    txtCityController?.dispose();
    txtZipcodeController?.dispose();
    txtshippingFeeController?.dispose();
    txtInstaController?.dispose();
    txtLineController?.dispose();
    txtbankController?.dispose();
    txtbankAccountController?.dispose();
  }

  /// Additional helper methods are added here.

}
