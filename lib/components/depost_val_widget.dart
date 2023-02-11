import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'depost_val_model.dart';
export 'depost_val_model.dart';

class DepostValWidget extends StatefulWidget {
  const DepostValWidget({Key? key}) : super(key: key);

  @override
  _DepostValWidgetState createState() => _DepostValWidgetState();
}

class _DepostValWidgetState extends State<DepostValWidget> {
  late DepostValModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepostValModel());

    _model.txtDepositController = TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return TextFormField(
      controller: _model.txtDepositController,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        hintText: '0.00',
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
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
      textAlign: TextAlign.center,
      validator: _model.txtDepositControllerValidator.asValidator(context),
    );
  }
}
