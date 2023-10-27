import '/components/recipient_of_transfer/recipient_of_transfer_widget.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'withdraw_success_widget.dart' show WithdrawSuccessWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WithdrawSuccessModel extends FlutterFlowModel<WithdrawSuccessWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList1 = [
    'success',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers1 = [];
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList2 = [
    'Animation 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers2 = [];
  // Model for recipient_of_transfer component.
  late RecipientOfTransferModel recipientOfTransferModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    riveAnimationAnimationsList1.forEach((name) {
      riveAnimationControllers1.add(FlutterFlowRiveController(
        name,
      ));
    });

    riveAnimationAnimationsList2.forEach((name) {
      riveAnimationControllers2.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });

    recipientOfTransferModel =
        createModel(context, () => RecipientOfTransferModel());
  }

  void dispose() {
    unfocusNode.dispose();
    recipientOfTransferModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
