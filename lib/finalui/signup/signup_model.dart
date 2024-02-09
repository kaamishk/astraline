import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  Local state fields for this page.

  String confirmPassword = '0';

  bool loading = false;

  String status = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
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
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Backend Call - API (GeoCordinatesVediAPI)] action in Container widget.
  ApiCallResponse? timeZoneUpdate;
  // Stores action output result for [Backend Call - API (BirthDetailVedicApi)] action in Container widget.
  ApiCallResponse? birthDetail;
  // Stores action output result for [Backend Call - API (VedicChart)] action in Container widget.
  ApiCallResponse? wheel;
  // Stores action output result for [Backend Call - API (PersonalCharacteristics)] action in Container widget.
  ApiCallResponse? characteristics;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    birthCountryFocusNode?.dispose();

    birthStateFocusNode?.dispose();

    birthPlaceFocusNode?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
