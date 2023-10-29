import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'ke84nfwu' /* Notifications */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ijg7jct8' /* Choose what notifcations you w... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: SwitchListTile.adaptive(
                value: _model.switchListTileValue1 ??= true,
                onChanged: (newValue) async {
                  setState(() => _model.switchListTileValue1 = newValue!);
                },
                title: Text(
                  FFLocalizations.of(context).getText(
                    'y29rtgd5' /* Push Notifications */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        lineHeight: 2.0,
                      ),
                ),
                subtitle: Text(
                  FFLocalizations.of(context).getText(
                    'ofugtlow' /* Receive Push notifications fro... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF8B97A2),
                      ),
                ),
                tileColor: FlutterFlowTheme.of(context).primaryBackground,
                activeColor: FlutterFlowTheme.of(context).primary,
                activeTrackColor: FlutterFlowTheme.of(context).accent1,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
            ),
            SwitchListTile.adaptive(
              value: _model.switchListTileValue2 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue2 = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'v26o8tud' /* Email Notifications */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'fgi6zyhr' /* Receive email notifications fr... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF8B97A2),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).primaryBackground,
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
            SwitchListTile.adaptive(
              value: _model.switchListTileValue3 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue3 = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  '5hyni8fg' /* Location Services */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  '65ks5nka' /* Allow us to track your locatio... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF8B97A2),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).primaryBackground,
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
            SwitchListTile.adaptive(
              value: _model.switchListTileValue4 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue4 = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'b3hca7b0' /* Location Services */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  '366zxxjn' /* Allow us to track your locatio... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF8B97A2),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).primaryBackground,
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
            SwitchListTile.adaptive(
              value: _model.switchListTileValue5 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue5 = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  '9e6474pt' /* Location Services */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'hpxs3p1v' /* Allow us to track your locatio... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF8B97A2),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).primaryBackground,
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
            SwitchListTile.adaptive(
              value: _model.switchListTileValue6 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue6 = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'a155pkhr' /* Location Services */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  '44acx9f4' /* Allow us to track your locatio... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF8B97A2),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).primaryBackground,
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
            SwitchListTile.adaptive(
              value: _model.switchListTileValue7 ??= true,
              onChanged: (newValue) async {
                setState(() => _model.switchListTileValue7 = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'katg0pxi' /* Location Services */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      lineHeight: 2.0,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'txxl339m' /* Allow us to track your locatio... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF8B97A2),
                    ),
              ),
              tileColor: FlutterFlowTheme.of(context).primaryBackground,
              activeColor: FlutterFlowTheme.of(context).primary,
              activeTrackColor: FlutterFlowTheme.of(context).accent1,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 50.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pop();
                },
                text: FFLocalizations.of(context).getText(
                  'om8uwjwa' /* Change Changes */,
                ),
                options: FFButtonOptions(
                  width: 190.0,
                  height: 56.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
