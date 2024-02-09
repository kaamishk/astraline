import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirmsubscription_widget.dart' show ConfirmsubscriptionWidget;
import 'package:flutter/material.dart';

class ConfirmsubscriptionModel
    extends FlutterFlowModel<ConfirmsubscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Stripe Payment] action in Container widget.
  String? paymentId;
  // Stores action output result for [Backend Call - API (customPushNotification)] action in Container widget.
  ApiCallResponse? apiResultgm6;
  // Stores action output result for [Backend Call - API (customEmails)] action in Container widget.
  ApiCallResponse? apiResults40;

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
