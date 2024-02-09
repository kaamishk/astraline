import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscriptionplans_widget.dart' show SubscriptionplansWidget;
import 'package:flutter/material.dart';

class SubscriptionplansModel extends FlutterFlowModel<SubscriptionplansWidget> {
  ///  Local state fields for this page.

  SubscriptionPlansRecord? selectedPlan;

  String duration = 'Monthly';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
