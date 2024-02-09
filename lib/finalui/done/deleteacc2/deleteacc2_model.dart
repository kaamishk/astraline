import '/flutter_flow/flutter_flow_util.dart';
import 'deleteacc2_widget.dart' show Deleteacc2Widget;
import 'package:flutter/material.dart';

class Deleteacc2Model extends FlutterFlowModel<Deleteacc2Widget> {
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
