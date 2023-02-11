import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneSignInModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }
    if (val.length > 9) {
      return 'Enter valid Phone number';
    }
    if (!RegExp('\\d').hasMatch(val)) {
      return 'Invalid value';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
  }

  void dispose() {
    phoneNumberController?.dispose();
  }

  /// Additional helper methods are added here.

}
