import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.firstnameController ??= TextEditingController();
    _model.firstnameFocusNode ??= FocusNode();
    _model.lastnameController ??= TextEditingController();
    _model.lastnameFocusNode ??= FocusNode();
    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    _model.phonenumberController ??= TextEditingController();
    _model.phonenumberFocusNode ??= FocusNode();
    _model.password1Controller ??= TextEditingController();
    _model.password1FocusNode ??= FocusNode();
    _model.confirmpassword2Controller ??= TextEditingController();
    _model.confirmpassword2FocusNode ??= FocusNode();
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).verifyscreens,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 181.0,
                      height: 64.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).verifyscreens,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'epsc8k6p' /* Sign Up */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFFCBCBCB),
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'cl4kez19' /* Create account today! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFE0E0E0),
                                        fontWeight: FontWeight.w300,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 78.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).verifyscreens,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'd4986y12' /* First name */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.firstnameController,
                                      focusNode: _model.firstnameFocusNode,
                                      onFieldSubmitted: (_) async {
                                        GoRouter.of(context).prepareAuthEvent();

                                        final user = await authManager
                                            .createAccountWithEmail(
                                          context,
                                          _model.firstnameController.text,
                                          _model.password1Controller.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        await UsersRecord.collection
                                            .doc(user.uid)
                                            .update(createUsersRecordData(
                                              firstName: '',
                                              lastName: '',
                                              phoneNumber: '',
                                              photoUrl: FFAppState().profileimg,
                                              uid: '',
                                            ));

                                        context.goNamedAuth(
                                            'dashboard', context.mounted);
                                      },
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .chartBg,
                                              fontWeight: FontWeight.w200,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'scfeohz2' /* first name */,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .chartBg,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        prefixIcon: Icon(
                                          FFIcons.kuser,
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          size: 18.0,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFFCBCBCB),
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .firstnameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.lastnameController,
                                      focusNode: _model.lastnameFocusNode,
                                      onFieldSubmitted: (_) async {
                                        GoRouter.of(context).prepareAuthEvent();

                                        final user = await authManager
                                            .createAccountWithEmail(
                                          context,
                                          _model.lastnameController.text,
                                          _model.password1Controller.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        await UsersRecord.collection
                                            .doc(user.uid)
                                            .update(createUsersRecordData(
                                              firstName: '',
                                              lastName: '',
                                              phoneNumber: '',
                                              photoUrl: FFAppState().profileimg,
                                              uid: '',
                                            ));

                                        context.goNamedAuth(
                                            'dashboard', context.mounted);
                                      },
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .chartBg,
                                              fontWeight: FontWeight.w200,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'culox81f' /* last name */,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .chartBg,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        prefixIcon: Icon(
                                          FFIcons.kuser,
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          size: 18.0,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFFCBCBCB),
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .lastnameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 78.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).verifyscreens,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2od00li2' /* Email */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.emailController,
                                    focusNode: _model.emailFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .chartBg,
                                            fontWeight: FontWeight.w200,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '7red3pd8' /* enter a valid email address */,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      prefixIcon: Icon(
                                        FFIcons.ksms,
                                        color: FlutterFlowTheme.of(context)
                                            .chartBg,
                                        size: 18.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFCBCBCB),
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.emailControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 78.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).verifyscreens,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ygww092v' /* Phone Number */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.phonenumberController,
                                    focusNode: _model.phonenumberFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .chartBg,
                                            fontWeight: FontWeight.w200,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'ih12q2qp' /* enter your mobile number here */,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      prefixIcon: Icon(
                                        FFIcons.kcall,
                                        color: FlutterFlowTheme.of(context)
                                            .chartBg,
                                        size: 18.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFCBCBCB),
                                        ),
                                    keyboardType: TextInputType.phone,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .phonenumberControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 78.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).verifyscreens,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ywn9va4r' /* Password */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.password1Controller,
                                    focusNode: _model.password1FocusNode,
                                    obscureText: !_model.password1Visibility,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .chartBg,
                                            fontWeight: FontWeight.w200,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'bmaraczb' /* create a password */,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      prefixIcon: Icon(
                                        FFIcons.klock1,
                                        color: FlutterFlowTheme.of(context)
                                            .chartBg,
                                        size: 18.0,
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model.password1Visibility =
                                              !_model.password1Visibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.password1Visibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          size: 18.0,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFCBCBCB),
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .password1ControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 78.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).verifyscreens,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'dygcyj7q' /* Confirm Password */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        _model.confirmpassword2Controller,
                                    focusNode: _model.confirmpassword2FocusNode,
                                    obscureText:
                                        !_model.confirmpassword2Visibility,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .chartBg,
                                            fontWeight: FontWeight.w200,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'qchsj1u3' /* confirm password */,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      prefixIcon: Icon(
                                        FFIcons.klock1,
                                        color: FlutterFlowTheme.of(context)
                                            .chartBg,
                                        size: 18.0,
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model
                                                  .confirmpassword2Visibility =
                                              !_model
                                                  .confirmpassword2Visibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.confirmpassword2Visibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .chartBg,
                                          size: 18.0,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFCBCBCB),
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .confirmpassword2ControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: CircleBorder(),
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Checkbox(
                        value: _model.checkboxValue ??= false,
                        onChanged: (newValue) async {
                          setState(() => _model.checkboxValue = newValue!);
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '4naf3d43' /* I agree to the Paavya  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Termsandconditions');
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '80vhhy7w' /* Terms & Conditions  */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'ui2rbktv' /*         and  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'PrivacyPolicy',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'rg8fljl9' /* Privacy Policy */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: (_model.password1Controller.text ==
                                    _model.confirmpassword2Controller.text) &&
                                (_model.emailController.text == null ||
                                    _model.emailController.text == '') &&
                                (_model.firstnameController.text == null ||
                                    _model.firstnameController.text == '') &&
                                (_model.lastnameController.text == null ||
                                    _model.lastnameController.text == '') &&
                                (_model.phonenumberController.text == null ||
                                    _model.phonenumberController.text == '') &&
                                (_model.checkboxValue == null)
                            ? null
                            : () async {
                                context.pushNamedAuth(
                                  'login',
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );

                                GoRouter.of(context).prepareAuthEvent();
                                if (_model.password1Controller.text !=
                                    _model.confirmpassword2Controller.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Passwords don\'t match!',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                final user =
                                    await authManager.createAccountWithEmail(
                                  context,
                                  _model.emailController.text,
                                  _model.password1Controller.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                await UsersRecord.collection
                                    .doc(user.uid)
                                    .update(createUsersRecordData(
                                      firstName: '',
                                      lastName: '',
                                      phoneNumber: '',
                                      photoUrl: FFAppState().profileimg,
                                      uid: '',
                                    ));
                              },
                        text: FFLocalizations.of(context).getText(
                          'bft2dbyk' /* Sign Up */,
                        ),
                        options: FFButtonOptions(
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).chartBg,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          elevation: 0.0,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 16.0, 50.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'u8ohmbyj' /* Already have an account? */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('login');
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ac3mqnxo' /*  Login */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
