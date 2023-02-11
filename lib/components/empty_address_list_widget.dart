import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_address_list_model.dart';
export 'empty_address_list_model.dart';

class EmptyAddressListWidget extends StatefulWidget {
  const EmptyAddressListWidget({Key? key}) : super(key: key);

  @override
  _EmptyAddressListWidgetState createState() => _EmptyAddressListWidgetState();
}

class _EmptyAddressListWidgetState extends State<EmptyAddressListWidget> {
  late EmptyAddressListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyAddressListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Image.asset(
                  'assets/images/list_(1).png',
                  width: 90,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Address List is empty',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
