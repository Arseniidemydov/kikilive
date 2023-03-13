import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/channel_rejection_form/channel_rejection_form_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminVerifyChannelModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtChannelName widget.
  TextEditingController? txtChannelNameController;
  String? Function(BuildContext, String?)? txtChannelNameControllerValidator;
  String? _txtChannelNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtChannelDesc widget.
  TextEditingController? txtChannelDescController;
  String? Function(BuildContext, String?)? txtChannelDescControllerValidator;
  String? _txtChannelDescControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtChannelFee widget.
  TextEditingController? txtChannelFeeController;
  String? Function(BuildContext, String?)? txtChannelFeeControllerValidator;
  String? _txtChannelFeeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtChannelNameControllerValidator = _txtChannelNameControllerValidator;
    txtChannelDescControllerValidator = _txtChannelDescControllerValidator;
    txtChannelFeeControllerValidator = _txtChannelFeeControllerValidator;
  }

  void dispose() {
    txtChannelNameController?.dispose();
    txtChannelDescController?.dispose();
    txtChannelFeeController?.dispose();
  }

  /// Additional helper methods are added here.

}
