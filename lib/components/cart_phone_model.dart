import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPhoneModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtPhone widget.
  TextEditingController? txtPhoneController;
  String? Function(BuildContext, String?)? txtPhoneControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtPhoneController?.dispose();
  }

  /// Additional helper methods are added here.

}
