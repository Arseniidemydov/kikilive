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

class AdminEarningsDepositModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtDepositPaymentID widget.
  TextEditingController? txtDepositPaymentIDController;
  String? Function(BuildContext, String?)?
      txtDepositPaymentIDControllerValidator;
  // State field(s) for txtDeposit widget.
  TextEditingController? txtDepositController;
  String? Function(BuildContext, String?)? txtDepositControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtDepositPaymentIDController?.dispose();
    txtDepositController?.dispose();
  }

  /// Additional helper methods are added here.

}
