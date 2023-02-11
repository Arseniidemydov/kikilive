import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DepostModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtDeposit widget.
  TextEditingController? txtDepositController;
  String? Function(BuildContext, String?)? txtDepositControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtDepositController?.dispose();
  }

  /// Additional helper methods are added here.

}
