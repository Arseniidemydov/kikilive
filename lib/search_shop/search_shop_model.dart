import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SearchShopModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtShopSearch widget.
  final txtShopSearchKey = GlobalKey();
  TextEditingController? txtShopSearchController;
  String? txtShopSearchSelectedOption;
  String? Function(BuildContext, String?)? txtShopSearchControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
