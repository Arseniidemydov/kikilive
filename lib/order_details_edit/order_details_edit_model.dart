import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderDetailsEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for txtShipComp widget.
  TextEditingController? txtShipCompController;
  String? Function(BuildContext, String?)? txtShipCompControllerValidator;
  // State field(s) for txtShipNo widget.
  TextEditingController? txtShipNoController;
  String? Function(BuildContext, String?)? txtShipNoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtShipCompController?.dispose();
    txtShipNoController?.dispose();
  }

  /// Additional helper methods are added here.

}
