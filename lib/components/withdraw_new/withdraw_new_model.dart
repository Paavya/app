import '/components/card_confirm_topup/card_confirm_topup_widget.dart';
import '/components/withdraw_badge/withdraw_badge_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'withdraw_new_widget.dart' show WithdrawNewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WithdrawNewModel extends FlutterFlowModel<WithdrawNewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Model for withdraw_badge component.
  late WithdrawBadgeModel withdrawBadgeModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    withdrawBadgeModel = createModel(context, () => WithdrawBadgeModel());
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    withdrawBadgeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
