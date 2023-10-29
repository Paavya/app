import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameController;
  String? Function(BuildContext, String?)? firstnameControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberController;
  String? Function(BuildContext, String?)? phonenumberControllerValidator;
  // State field(s) for password1 widget.
  FocusNode? password1FocusNode;
  TextEditingController? password1Controller;
  late bool password1Visibility;
  String? Function(BuildContext, String?)? password1ControllerValidator;
  // State field(s) for confirmpassword2 widget.
  FocusNode? confirmpassword2FocusNode;
  TextEditingController? confirmpassword2Controller;
  late bool confirmpassword2Visibility;
  String? Function(BuildContext, String?)? confirmpassword2ControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    password1Visibility = false;
    confirmpassword2Visibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    firstnameFocusNode?.dispose();
    firstnameController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberController?.dispose();

    password1FocusNode?.dispose();
    password1Controller?.dispose();

    confirmpassword2FocusNode?.dispose();
    confirmpassword2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
