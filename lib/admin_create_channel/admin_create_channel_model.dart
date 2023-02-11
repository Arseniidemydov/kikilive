import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCreateChannelModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for txtChannelName widget.
  TextEditingController? txtChannelNameController;
  String? Function(BuildContext, String?)? txtChannelNameControllerValidator;
  String? _txtChannelNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
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

    if (val.length < 20) {
      return 'Requires at least 20 characters.';
    }
    if (val.length > 250) {
      return 'Maximum 250 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ddChannelType widget.
  String? ddChannelTypeValue;
  // State field(s) for txtChannelFee widget.
  TextEditingController? txtChannelFeeController;
  String? Function(BuildContext, String?)? txtChannelFeeControllerValidator;
  String? _txtChannelFeeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
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
