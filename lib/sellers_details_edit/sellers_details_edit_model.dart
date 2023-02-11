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

class SellersDetailsEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  TextEditingController? txtNameController;
  String? Function(BuildContext, String?)? txtNameControllerValidator;
  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
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
  // State field(s) for txtshippingFee widget.
  TextEditingController? txtshippingFeeController;
  String? Function(BuildContext, String?)? txtshippingFeeControllerValidator;
  // State field(s) for txtInsta widget.
  TextEditingController? txtInstaController;
  String? Function(BuildContext, String?)? txtInstaControllerValidator;
  // State field(s) for txtLine widget.
  TextEditingController? txtLineController;
  String? Function(BuildContext, String?)? txtLineControllerValidator;
  // State field(s) for txtbank widget.
  TextEditingController? txtbankController;
  String? Function(BuildContext, String?)? txtbankControllerValidator;
  // State field(s) for txtbankAccount widget.
  TextEditingController? txtbankAccountController;
  String? Function(BuildContext, String?)? txtbankAccountControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

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
