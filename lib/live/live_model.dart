import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/broadcast_name_widget.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LiveModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  // Stores action output result for [Backend Call - API (getLiveStreamId)] action in Container widget.
  ApiCallResponse? apiResultvaf;
  // Stores action output result for [Backend Call - API (getPastLiveStream)] action in Container widget.
  ApiCallResponse? apiResulto0b;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
