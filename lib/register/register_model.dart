import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtPassword widget.
  TextEditingController? txtPasswordController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordControllerValidator;
  // State field(s) for txtPasswordReType widget.
  TextEditingController? txtPasswordReTypeController;
  late bool txtPasswordReTypeVisibility;
  String? Function(BuildContext, String?)? txtPasswordReTypeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtPasswordVisibility = false;
    txtPasswordReTypeVisibility = false;
  }

  void dispose() {
    txtEmailController?.dispose();
    txtPasswordController?.dispose();
    txtPasswordReTypeController?.dispose();
  }

  /// Additional helper methods are added here.

}
