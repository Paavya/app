import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/savings_buttons/savings_buttons_widget.dart';
import '/components/topup_new/topup_new_widget.dart';
import '/components/upcoming_bills/upcoming_bills_widget.dart';
import '/components/withdraw_new/withdraw_new_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for upcoming_bills component.
  late UpcomingBillsModel upcomingBillsModel;
  // Model for Savings_buttons component.
  late SavingsButtonsModel savingsButtonsModel;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    upcomingBillsModel = createModel(context, () => UpcomingBillsModel());
    savingsButtonsModel = createModel(context, () => SavingsButtonsModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    upcomingBillsModel.dispose();
    savingsButtonsModel.dispose();
    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
