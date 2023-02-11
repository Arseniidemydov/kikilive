import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApprovalModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtDisplayName widget.
  TextEditingController? txtDisplayNameController;
  String? Function(BuildContext, String?)? txtDisplayNameControllerValidator;
  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtDisplayNameController?.dispose();
    txtPhoneController?.dispose();
    textController3?.dispose();
  }

  /// Additional helper methods are added here.

}
