import '/components/add_new/add_new_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'topup_widget.dart' show TopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopupModel extends FlutterFlowModel<TopupWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for addNew component.
  late AddNewModel addNewModel1;
  // Model for addNew component.
  late AddNewModel addNewModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addNewModel1 = createModel(context, () => AddNewModel());
    addNewModel2 = createModel(context, () => AddNewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    addNewModel1.dispose();
    addNewModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
