import '/flutter_flow/flutter_flow_util.dart';
import 'passwordverification_widget.dart' show PasswordverificationWidget;
import 'package:flutter/material.dart';

class PasswordverificationModel
    extends FlutterFlowModel<PasswordverificationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    passwordTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
