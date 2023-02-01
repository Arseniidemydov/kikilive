import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DepostWidget extends StatefulWidget {
  const DepostWidget({Key? key}) : super(key: key);

  @override
  _DepostWidgetState createState() => _DepostWidgetState();
}

class _DepostWidgetState extends State<DepostWidget> {
  TextEditingController? txtDepositController;

  @override
  void initState() {
    super.initState();
    txtDepositController = TextEditingController();
  }

  @override
  void dispose() {
    txtDepositController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border.all(
          color: FlutterFlowTheme.of(context).lineColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
        child: TextFormField(
          controller: txtDepositController,
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            hintText: '00.00',
            hintStyle: FlutterFlowTheme.of(context).bodyText2,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
          ),
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ),
    );
  }
}
