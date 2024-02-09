import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profileedit_widget.dart' show ProfileeditWidget;
import 'package:flutter/material.dart';

class ProfileeditModel extends FlutterFlowModel<ProfileeditWidget> {
  ///  Local state fields for this page.

  String status = 'O';

  String response = '0';

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for birthCountry widget.
  final birthCountryKey = GlobalKey();
  FocusNode? birthCountryFocusNode;
  TextEditingController? birthCountryController;
  String? birthCountrySelectedOption;
  String? Function(BuildContext, String?)? birthCountryControllerValidator;
  // State field(s) for birthState widget.
  final birthStateKey = GlobalKey();
  FocusNode? birthStateFocusNode;
  TextEditingController? birthStateController;
  String? birthStateSelectedOption;
  String? Function(BuildContext, String?)? birthStateControllerValidator;
  // State field(s) for birthPlace widget.
  final birthPlaceKey = GlobalKey();
  FocusNode? birthPlaceFocusNode;
  TextEditingController? birthPlaceController;
  String? birthPlaceSelectedOption;
  String? Function(BuildContext, String?)? birthPlaceControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (GeoCordinatesVediAPI)] action in Container widget.
  ApiCallResponse? timeZoneUpdate2;
  // Stores action output result for [Backend Call - API (BirthDetailVedicApi)] action in Container widget.
  ApiCallResponse? birthDetail2;
  // Stores action output result for [Backend Call - API (VedicChart)] action in Container widget.
  ApiCallResponse? wheel2;
  // Stores action output result for [Backend Call - API (PersonalCharacteristics)] action in Container widget.
  ApiCallResponse? characteristics2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    birthCountryFocusNode?.dispose();

    birthStateFocusNode?.dispose();

    birthPlaceFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
