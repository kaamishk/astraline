import '/finalcomponents/nav_home/nav_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transitreport_widget.dart' show TransitreportWidget;
import 'package:flutter/material.dart';

class TransitreportModel extends FlutterFlowModel<TransitreportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navHome component.
  late NavHomeModel navHomeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navHomeModel = createModel(context, () => NavHomeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navHomeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
