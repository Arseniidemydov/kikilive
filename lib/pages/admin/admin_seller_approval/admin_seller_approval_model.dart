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

class AdminSellerApprovalModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Username widget.
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  // State field(s) for E-mail widget.
  TextEditingController? eMailController;
  String? Function(BuildContext, String?)? eMailControllerValidator;
  // State field(s) for Phone widget.
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for AddressLine1 widget.
  TextEditingController? addressLine1Controller;
  String? Function(BuildContext, String?)? addressLine1ControllerValidator;
  // State field(s) for AddressLine2 widget.
  TextEditingController? addressLine2Controller;
  String? Function(BuildContext, String?)? addressLine2ControllerValidator;
  // State field(s) for City widget.
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for Zipcode widget.
  TextEditingController? zipcodeController;
  String? Function(BuildContext, String?)? zipcodeControllerValidator;
  // State field(s) for ShippingCost widget.
  TextEditingController? shippingCostController;
  String? Function(BuildContext, String?)? shippingCostControllerValidator;
  // State field(s) for Instagram widget.
  TextEditingController? instagramController;
  String? Function(BuildContext, String?)? instagramControllerValidator;
  // State field(s) for Line widget.
  TextEditingController? lineController;
  String? Function(BuildContext, String?)? lineControllerValidator;
  // State field(s) for RejectMessage widget.
  TextEditingController? rejectMessageController;
  String? Function(BuildContext, String?)? rejectMessageControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    usernameController?.dispose();
    eMailController?.dispose();
    phoneController?.dispose();
    addressLine1Controller?.dispose();
    addressLine2Controller?.dispose();
    cityController?.dispose();
    zipcodeController?.dispose();
    shippingCostController?.dispose();
    instagramController?.dispose();
    lineController?.dispose();
    rejectMessageController?.dispose();
  }

  /// Additional helper methods are added here.

}
