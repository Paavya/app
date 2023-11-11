import '/components/large_card/large_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'card_details_widget.dart' show CardDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardDetailsModel extends FlutterFlowModel<CardDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for large_Card component.
  late LargeCardModel largeCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    largeCardModel = createModel(context, () => LargeCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    largeCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
