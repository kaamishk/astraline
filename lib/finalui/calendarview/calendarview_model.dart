import '/components/calendar2_widget.dart';
import '/finalcomponents/nav_yoga/nav_yoga_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendarview_widget.dart' show CalendarviewWidget;
import 'package:flutter/material.dart';

class CalendarviewModel extends FlutterFlowModel<CalendarviewWidget> {
  ///  Local state fields for this page.

  DateTime? selected;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for calendar2 component.
  late Calendar2Model calendar2Model;
  // Model for navYoga component.
  late NavYogaModel navYogaModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendar2Model = createModel(context, () => Calendar2Model());
    navYogaModel = createModel(context, () => NavYogaModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    calendar2Model.dispose();
    navYogaModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
