import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditChannelModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtChannelName widget.
  TextEditingController? txtChannelNameController;
  String? Function(BuildContext, String?)? txtChannelNameControllerValidator;
  // State field(s) for txtChannelDesc widget.
  TextEditingController? txtChannelDescController;
  String? Function(BuildContext, String?)? txtChannelDescControllerValidator;
  // State field(s) for txtChannelFee widget.
  TextEditingController? txtChannelFeeController;
  String? Function(BuildContext, String?)? txtChannelFeeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtChannelNameController?.dispose();
    txtChannelDescController?.dispose();
    txtChannelFeeController?.dispose();
  }

  /// Additional helper methods are added here.

}
