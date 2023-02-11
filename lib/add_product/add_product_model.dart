import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ddCategory widget.
  String? ddCategoryValue;
  // State field(s) for ddSubCategory widget.
  String? ddSubCategoryValue;
  // State field(s) for txtProductName widget.
  TextEditingController? txtProductNameController;
  String? Function(BuildContext, String?)? txtProductNameControllerValidator;
  String? _txtProductNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 60) {
      return 'Maximum 60 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtProductPrice widget.
  TextEditingController? txtProductPriceController;
  String? Function(BuildContext, String?)? txtProductPriceControllerValidator;
  String? _txtProductPriceControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for txtInventory widget.
  TextEditingController? txtInventoryController;
  String? Function(BuildContext, String?)? txtInventoryControllerValidator;
  // State field(s) for txtProDesc widget.
  TextEditingController? txtProDescController;
  String? Function(BuildContext, String?)? txtProDescControllerValidator;
  String? _txtProDescControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtProductNameControllerValidator = _txtProductNameControllerValidator;
    txtProductPriceControllerValidator = _txtProductPriceControllerValidator;
    txtProDescControllerValidator = _txtProDescControllerValidator;
  }

  void dispose() {
    txtProductNameController?.dispose();
    txtProductPriceController?.dispose();
    txtInventoryController?.dispose();
    txtProDescController?.dispose();
  }

  /// Additional helper methods are added here.

}
