import '/finalcomponents/nav_yoga/nav_yoga_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'routine_widget.dart' show RoutineWidget;
import 'package:flutter/material.dart';

class RoutineModel extends FlutterFlowModel<RoutineWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navYoga component.
  late NavYogaModel navYogaModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navYogaModel = createModel(context, () => NavYogaModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navYogaModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
