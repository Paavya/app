import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'large_card_model.dart';
export 'large_card_model.dart';

class LargeCardWidget extends StatefulWidget {
  const LargeCardWidget({Key? key}) : super(key: key);

  @override
  _LargeCardWidgetState createState() => _LargeCardWidgetState();
}

class _LargeCardWidgetState extends State<LargeCardWidget> {
  late LargeCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LargeCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
        child: Container(
          width: 370.0,
          height: 190.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                color: Color(0x4B1A1F24),
                offset: Offset(0.0, 2.0),
              )
            ],
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondary,
                FlutterFlowTheme.of(context).primary
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.94, -1.0),
              end: AlignmentDirectional(-0.94, 1.0),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/default-project-widgets-xzsp5v/assets/ddr0sc80h0hs/@3xlogoMark_outline.png',
                  width: 44.0,
                  height: 44.0,
                  fit: BoxFit.cover,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'j9as88qh' /* Balance */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'c871b5ms' /* $7,630 */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 32.0,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'dv4zfrn8' /* **** 0149 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto Mono',
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '3wgdme74' /* 05/25 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto Mono',
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      back: Container(
        width: 327.0,
        height: 204.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 31.0,
                      decoration: BoxDecoration(
                        color: Color(0x4C57636C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '2jrvax08' /* CVV */,
                          ),
                          textAlign: TextAlign.end,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 51.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Color(0x4C57636C),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'urlt7mkz' /* 422 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
