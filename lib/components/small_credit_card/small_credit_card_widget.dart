import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'small_credit_card_model.dart';
export 'small_credit_card_model.dart';

class SmallCreditCardWidget extends StatefulWidget {
  const SmallCreditCardWidget({Key? key}) : super(key: key);

  @override
  _SmallCreditCardWidgetState createState() => _SmallCreditCardWidgetState();
}

class _SmallCreditCardWidgetState extends State<SmallCreditCardWidget> {
  late SmallCreditCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallCreditCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 180.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 46.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/images/visa_Dark_Mode.svg'
                          : 'assets/images/visa_white.svg',
                      width: 309.0,
                      height: 227.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 38.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'pd0zujvg' /* 5229-9012-3245-6789 */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 12.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'hr66oq0e' /* Trey Banks */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    '9ti5igsu' /* Exp  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                      ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'znd5pypt' /* 11/25 */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
