import '/backend/api_requests/api_calls.dart';
import '/finalcomponents/nav_home/nav_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (PersonalCharacteristics)] action in home widget.
  ApiCallResponse? transiRep;
  // Stores action output result for [Backend Call - API (VediPredictionDailySun)] action in home widget.
  ApiCallResponse? apiResultrsb;
  // Stores action output result for [Backend Call - API (MoonPhaseVediAPI)] action in home widget.
  ApiCallResponse? apiResultgln;
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
