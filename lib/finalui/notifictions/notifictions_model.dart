import '/flutter_flow/flutter_flow_util.dart';
import 'notifictions_widget.dart' show NotifictionsWidget;
import 'package:flutter/material.dart';

class NotifictionsModel extends FlutterFlowModel<NotifictionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for allNotification widget.
  bool? allNotificationValue;
  // State field(s) for dtsEmail widget.
  bool? dtsEmailValue;
  // State field(s) for dtsPush widget.
  bool? dtsPushValue;
  // State field(s) for sEmail widget.
  bool? sEmailValue;
  // State field(s) for sPush widget.
  bool? sPushValue;
  // State field(s) for mEmail widget.
  bool? mEmailValue;
  // State field(s) for cEmail widget.
  bool? cEmailValue;

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
