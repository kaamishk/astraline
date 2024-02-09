import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'signup_model.dart';
export 'signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({
    super.key,
    bool? gSignIn,
  }) : gSignIn = gSignIn ?? false;

  final bool gSignIn;

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget>
    with TickerProviderStateMixin {
  late SignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());

    _model.firstNameController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.birthCountryController ??= TextEditingController();

    _model.birthStateController ??= TextEditingController();

    _model.birthPlaceController ??= TextEditingController();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).background,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x01C1C1C1),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/signup_bg.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 130.0,
                                height: 130.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    _model.uploadedFileUrl,
                                    'https://firebasestorage.googleapis.com/v0/b/astraline-c5463.appspot.com/o/no-photo-available-icon-20.jpg?alt=media&token=0774d171-edb2-4630-9846-4e562d5e7555',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.27, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 90.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: const Color(0xFF4E4E4E),
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: const Color(0xFF4E4E4E),
                                  icon: Icon(
                                    Icons.photo_camera_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Upload a photo',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: const Color(0x80FFFFFF),
                                    fontSize: 12.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'Sign Up',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Libre Franklin',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 30.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: TextFormField(
                                              controller:
                                                  _model.firstNameController,
                                              focusNode:
                                                  _model.firstNameFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'First Name',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          fontSize: 16.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00E0E3E7),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFFDC85F),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .txtfieldbg,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              validator: _model
                                                  .firstNameControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: TextFormField(
                                              controller:
                                                  _model.lastNameController,
                                              focusNode:
                                                  _model.lastNameFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Last Name',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          fontSize: 16.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00E0E3E7),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFFDC85F),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .txtfieldbg,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              validator: _model
                                                  .lastNameControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: DateTime(1900),
                                        lastDate: getCurrentTimestamp,
                                      );

                                      if (datePicked1Date != null) {
                                        safeSetState(() {
                                          _model.datePicked1 = DateTime(
                                            datePicked1Date.year,
                                            datePicked1Date.month,
                                            datePicked1Date.day,
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .txtfieldbg,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.datePicked1 != null
                                                    ? dateTimeFormat('yMMMd',
                                                        _model.datePicked1)
                                                    : 'Birthday',
                                                'Birthday',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            const Color(0x80FFFFFF),
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.calendar_month,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final datePicked2Time =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                      );
                                      if (datePicked2Time != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = DateTime(
                                            getCurrentTimestamp.year,
                                            getCurrentTimestamp.month,
                                            getCurrentTimestamp.day,
                                            datePicked2Time.hour,
                                            datePicked2Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .txtfieldbg,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.datePicked2 != null
                                                    ? dateTimeFormat('jm',
                                                        _model.datePicked2)
                                                    : 'Birth Time',
                                                'Birth Time',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            const Color(0x80FFFFFF),
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.timer_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: FutureBuilder<List<CountryRow>>(
                                      future: CountryTable().queryRows(
                                        queryFn: (q) => q.order('countryCode',
                                            ascending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CountryRow>
                                            birthCountryCountryRowList =
                                            snapshot.data!;
                                        return Autocomplete<String>(
                                          initialValue: const TextEditingValue(),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return birthCountryCountryRowList
                                                .map((e) => e.countryCode)
                                                .toList()
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey:
                                                  _model.birthCountryKey,
                                              textController: _model
                                                  .birthCountryController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle: const TextStyle(),
                                              textHighlightStyle: const TextStyle(),
                                              elevation: 4.0,
                                              optionBackgroundColor:
                                                  const Color(0x1AFFFFFF),
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              maxHeight: 200.0,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            setState(() => _model
                                                    .birthCountrySelectedOption =
                                                selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.birthCountryFocusNode =
                                                focusNode;

                                            _model.birthCountryController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.birthCountryKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.birthCountryController',
                                                const Duration(milliseconds: 2),
                                                () => setState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Birth Country',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          fontSize: 16.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00E0E3E7),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFFDC85F),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .txtfieldbg,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            const Color(0x80FFFFFF),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              validator: _model
                                                  .birthCountryControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: FutureBuilder<List<StatesRow>>(
                                      future: StatesTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'countryCode',
                                              _model
                                                  .birthCountryController.text,
                                            )
                                            .order('state', ascending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<StatesRow>
                                            birthStateStatesRowList =
                                            snapshot.data!;
                                        return Autocomplete<String>(
                                          initialValue: const TextEditingValue(),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return birthStateStatesRowList
                                                .map((e) => e.state)
                                                .withoutNulls
                                                .toList()
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey:
                                                  _model.birthStateKey,
                                              textController:
                                                  _model.birthStateController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle: const TextStyle(),
                                              textHighlightStyle: const TextStyle(),
                                              elevation: 4.0,
                                              optionBackgroundColor:
                                                  const Color(0x1AFFFFFF),
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              maxHeight: 200.0,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            setState(() => _model
                                                    .birthStateSelectedOption =
                                                selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.birthStateFocusNode =
                                                focusNode;

                                            _model.birthStateController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.birthStateKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.birthStateController',
                                                const Duration(milliseconds: 2),
                                                () => setState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Birth State',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          fontSize: 16.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00E0E3E7),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFFDC85F),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .txtfieldbg,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            const Color(0x80FFFFFF),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              validator: _model
                                                  .birthStateControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: FutureBuilder<List<GeoDataRow>>(
                                      future: GeoDataTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'country',
                                              _model
                                                  .birthCountryController.text,
                                            )
                                            .eq(
                                              'admin_name',
                                              _model.birthStateController.text,
                                            )
                                            .order('city', ascending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<GeoDataRow>
                                            birthPlaceGeoDataRowList =
                                            snapshot.data!;
                                        return Autocomplete<String>(
                                          initialValue: const TextEditingValue(),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return birthPlaceGeoDataRowList
                                                .map((e) => e.city)
                                                .toList()
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey:
                                                  _model.birthPlaceKey,
                                              textController:
                                                  _model.birthPlaceController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle: const TextStyle(),
                                              textHighlightStyle: const TextStyle(),
                                              elevation: 4.0,
                                              optionBackgroundColor:
                                                  const Color(0x1AFFFFFF),
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              maxHeight: 200.0,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            setState(() => _model
                                                    .birthPlaceSelectedOption =
                                                selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.birthPlaceFocusNode =
                                                focusNode;

                                            _model.birthPlaceController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.birthPlaceKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.birthPlaceController',
                                                const Duration(milliseconds: 2),
                                                () => setState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Birth City',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          fontSize: 16.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00E0E3E7),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFFDC85F),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .txtfieldbg,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            const Color(0x80FFFFFF),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              validator: _model
                                                  .birthPlaceControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                if (!widget.gSignIn)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: TextFormField(
                                        controller: _model.emailController,
                                        focusNode: _model.emailFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color: const Color(0x80FFFFFF),
                                                    fontSize: 16.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00E0E3E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFDC85F),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .txtfieldbg,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .emailControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                if (!widget.gSignIn)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: TextFormField(
                                        controller: _model.passwordController,
                                        focusNode: _model.passwordFocusNode,
                                        autofocus: true,
                                        obscureText: !_model.passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color: const Color(0x80FFFFFF),
                                                    fontSize: 16.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00E0E3E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFDC85F),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .txtfieldbg,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model.passwordVisibility =
                                                  !_model.passwordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: const Color(0x9AFFFFFF),
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .passwordControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FutureBuilder<List<GeoDataRow>>(
                                        future: GeoDataTable().querySingleRow(
                                          queryFn: (q) => q
                                              .eq(
                                                'country',
                                                _model.birthCountryController
                                                    .text,
                                              )
                                              .eq(
                                                'admin_name',
                                                _model
                                                    .birthStateController.text,
                                              )
                                              .eq(
                                                'city',
                                                _model
                                                    .birthPlaceController.text,
                                              ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .midyellow,
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<GeoDataRow>
                                              containerGeoDataRowList =
                                              snapshot.data!;
                                          final containerGeoDataRow =
                                              containerGeoDataRowList.isNotEmpty
                                                  ? containerGeoDataRowList
                                                      .first
                                                  : null;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.confirmPassword = _model
                                                    .passwordController.text;
                                                _model.loading = true;
                                              });
                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation']!
                                                    .controller
                                                  ..reset()
                                                  ..repeat();
                                              }
                                              _model.timeZoneUpdate =
                                                  await GeoCordinatesVediAPICall
                                                      .call(
                                                city: _model
                                                    .birthPlaceController.text,
                                              );
                                              _model.birthDetail =
                                                  await BirthDetailVedicApiCall
                                                      .call(
                                                dob: dateTimeFormat(
                                                    'dd/MM/yyyy',
                                                    _model.datePicked1),
                                                tob: dateTimeFormat('HH:MM',
                                                    _model.datePicked2),
                                                lat: containerGeoDataRow?.lat,
                                                lon: containerGeoDataRow?.lng,
                                                tz: functions.stringToDouble(
                                                    getJsonField(
                                                  (_model.timeZoneUpdate
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.response[0].tz''',
                                                ).toString()),
                                              );
                                              _model.wheel =
                                                  await VedicChartCall.call(
                                                dob: dateTimeFormat(
                                                    'dd/MM/yyyy',
                                                    _model.datePicked1),
                                                tob: dateTimeFormat('HH:MM',
                                                    _model.datePicked2),
                                                lat: containerGeoDataRow?.lat,
                                                lon: containerGeoDataRow?.lng,
                                                tz: functions.stringToDouble(
                                                    getJsonField(
                                                  (_model.timeZoneUpdate
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.response[0].tz''',
                                                ).toString()),
                                                lang: 'en',
                                                color: '%23ffffff',
                                                style: 'north',
                                                div: 'D1',
                                                format: 'base64',
                                              );
                                              _model.characteristics =
                                                  await PersonalCharacteristicsCall
                                                      .call(
                                                dob: dateTimeFormat(
                                                    'dd/MM/yyyy',
                                                    _model.datePicked1),
                                                tob: dateTimeFormat('HH:MM',
                                                    _model.datePicked2),
                                                lat: containerGeoDataRow?.lat,
                                                lon: containerGeoDataRow?.lng,
                                                tz: functions.stringToDouble(
                                                    getJsonField(
                                                  (_model.timeZoneUpdate
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.response[0].tz''',
                                                ).toString()),
                                              );
                                              if (widget.gSignIn) {
                                                await currentUserReference!
                                                    .update({
                                                  ...createUsersRecordData(
                                                    photoUrl:
                                                        _model.uploadedFileUrl,
                                                    lastName: _model
                                                        .lastNameController
                                                        .text,
                                                    birthDate:
                                                        _model.datePicked1,
                                                    birthTime:
                                                        _model.datePicked2,
                                                    birthPlace: _model
                                                        .birthPlaceController
                                                        .text,
                                                    displayName: _model
                                                        .firstNameController
                                                        .text,
                                                    createdTime:
                                                        getCurrentTimestamp,
                                                    sunSign:
                                                        BirthDetailVedicApiCall
                                                            .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?[1],
                                                    moonSign:
                                                        BirthDetailVedicApiCall
                                                            .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?[2],
                                                    ascendantSign:
                                                        BirthDetailVedicApiCall
                                                            .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?[0],
                                                    elementSign: () {
                                                      if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Aries') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Leo') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Sagittarius')) {
                                                        return 'Fire';
                                                      } else if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Taurus') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Virgo') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Capricorn')) {
                                                        return 'Earth';
                                                      } else if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Gemini') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Libra') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Aquarius')) {
                                                        return 'Air';
                                                      } else if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0]) ==
                                                              'Cancer') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0]) ==
                                                              'Scorpio') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0]) ==
                                                              'Pisces')) {
                                                        return 'Water';
                                                      } else {
                                                        return '0';
                                                      }
                                                    }(),
                                                    birthChart: (_model.wheel
                                                                ?.jsonBody ??
                                                            '')
                                                        .toString(),
                                                    day: functions.splitDate(
                                                        _model.datePicked1!,
                                                        'day'),
                                                    month: functions.splitDate(
                                                        _model.datePicked1!,
                                                        'month'),
                                                    year: functions.splitDate(
                                                        _model.datePicked1!,
                                                        'year'),
                                                    hour: functions.spiltTime(
                                                        _model.datePicked2!,
                                                        'hour'),
                                                    min: functions.spiltTime(
                                                        _model.datePicked2!,
                                                        'min'),
                                                    lat: containerGeoDataRow
                                                        ?.lat,
                                                    long: containerGeoDataRow
                                                        ?.lng,
                                                    tZone: functions
                                                        .stringToDouble(
                                                            getJsonField(
                                                      (_model.timeZoneUpdate
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.response[0].tz''',
                                                    ).toString()),
                                                    zodiacNumber:
                                                        functions.zodiacNumber(
                                                            BirthDetailVedicApiCall
                                                                .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )![1]),
                                                    birthCountry: _model
                                                        .birthCountryController
                                                        .text,
                                                    birthState: _model
                                                        .birthStateController
                                                        .text,
                                                    selectedPlan: FFAppState()
                                                        .selectedPlan,
                                                    svgContent: (_model
                                                            .wheel?.bodyText ??
                                                        ''),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'currentHouse':
                                                          PersonalCharacteristicsCall
                                                              .currentHouse(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'verbalLocation':
                                                          PersonalCharacteristicsCall
                                                              .verbalLocation(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'currentZodiac':
                                                          PersonalCharacteristicsCall
                                                              .currentZodiac(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordOfZodiac':
                                                          PersonalCharacteristicsCall
                                                              .lordOfZodiac(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordZodiacLocation':
                                                          PersonalCharacteristicsCall
                                                              .lordZodiacLocation(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordHouseLocation':
                                                          PersonalCharacteristicsCall
                                                              .lordHouseLocation(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'personalisedPrediction':
                                                          PersonalCharacteristicsCall
                                                              .personalisedPrediction(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordStrength':
                                                          PersonalCharacteristicsCall
                                                              .lordStrength(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                    },
                                                  ),
                                                });
                                                setState(() {
                                                  _model.loading = false;
                                                });
                                                if (animationsMap[
                                                        'imageOnActionTriggerAnimation'] !=
                                                    null) {
                                                  animationsMap[
                                                          'imageOnActionTriggerAnimation']!
                                                      .controller
                                                      .stop();
                                                }

                                                context.pushNamedAuth(
                                                  'onboarding1',
                                                  context.mounted,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 250),
                                                    ),
                                                  },
                                                );

                                                await requestPermission(
                                                    notificationsPermission);
                                              } else {
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();
                                                if (_model.passwordController
                                                        .text !=
                                                    _model.confirmPassword) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Passwords don\'t match!',
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                final user = await authManager
                                                    .createAccountWithEmail(
                                                  context,
                                                  _model.emailController.text,
                                                  _model
                                                      .passwordController.text,
                                                );
                                                if (user == null) {
                                                  return;
                                                }

                                                await UsersRecord.collection
                                                    .doc(user.uid)
                                                    .update({
                                                  ...createUsersRecordData(
                                                    email: _model
                                                        .emailController.text,
                                                    photoUrl:
                                                        _model.uploadedFileUrl,
                                                    lastName: _model
                                                        .lastNameController
                                                        .text,
                                                    birthDate:
                                                        _model.datePicked1,
                                                    birthTime:
                                                        _model.datePicked2,
                                                    birthPlace: _model
                                                        .birthPlaceController
                                                        .text,
                                                    displayName: _model
                                                        .firstNameController
                                                        .text,
                                                    createdTime:
                                                        getCurrentTimestamp,
                                                    sunSign:
                                                        BirthDetailVedicApiCall
                                                            .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?[1],
                                                    moonSign:
                                                        BirthDetailVedicApiCall
                                                            .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?[2],
                                                    ascendantSign:
                                                        BirthDetailVedicApiCall
                                                            .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?[0],
                                                    elementSign: () {
                                                      if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Aries') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Leo') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Sagittarius')) {
                                                        return 'Fire';
                                                      } else if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Taurus') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Virgo') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Capricorn')) {
                                                        return 'Earth';
                                                      } else if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Gemini') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Libra') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[1]) ==
                                                              'Aquarius')) {
                                                        return 'Air';
                                                      } else if (((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0]) ==
                                                              'Cancer') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0]) ==
                                                              'Scorpio') ||
                                                          ((BirthDetailVedicApiCall
                                                                  .zodiacList(
                                                                (_model.birthDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?[0]) ==
                                                              'Pisces')) {
                                                        return 'Water';
                                                      } else {
                                                        return '0';
                                                      }
                                                    }(),
                                                    day: functions.splitDate(
                                                        _model.datePicked1!,
                                                        'day'),
                                                    month: functions.splitDate(
                                                        _model.datePicked1!,
                                                        'month'),
                                                    year: functions.splitDate(
                                                        _model.datePicked1!,
                                                        'year'),
                                                    hour: functions.spiltTime(
                                                        _model.datePicked2!,
                                                        'hour'),
                                                    min: functions.spiltTime(
                                                        _model.datePicked2!,
                                                        'min'),
                                                    lat: containerGeoDataRow
                                                        ?.lat,
                                                    long: containerGeoDataRow
                                                        ?.lng,
                                                    tZone: functions
                                                        .stringToDouble(
                                                            getJsonField(
                                                      (_model.timeZoneUpdate
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.response[0].tz''',
                                                    ).toString()),
                                                    zodiacNumber:
                                                        functions.zodiacNumber(
                                                            BirthDetailVedicApiCall
                                                                .zodiacList(
                                                      (_model.birthDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                    )![1]),
                                                    birthCountry: _model
                                                        .birthCountryController
                                                        .text,
                                                    birthState: _model
                                                        .birthStateController
                                                        .text,
                                                    password:
                                                        _model.confirmPassword,
                                                    selectedPlan: FFAppState()
                                                        .selectedPlan,
                                                    svgContent: (_model
                                                            .wheel?.bodyText ??
                                                        ''),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'currentHouse':
                                                          PersonalCharacteristicsCall
                                                              .currentHouse(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'verbalLocation':
                                                          PersonalCharacteristicsCall
                                                              .verbalLocation(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'currentZodiac':
                                                          PersonalCharacteristicsCall
                                                              .currentZodiac(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordOfZodiac':
                                                          PersonalCharacteristicsCall
                                                              .lordOfZodiac(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordZodiacLocation':
                                                          PersonalCharacteristicsCall
                                                              .lordZodiacLocation(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordHouseLocation':
                                                          PersonalCharacteristicsCall
                                                              .lordHouseLocation(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'personalisedPrediction':
                                                          PersonalCharacteristicsCall
                                                              .personalisedPrediction(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'lordStrength':
                                                          PersonalCharacteristicsCall
                                                              .lordStrength(
                                                        (_model.characteristics
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                    },
                                                  ),
                                                });

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  uid: currentUserUid,
                                                ));
                                                await authManager
                                                    .sendEmailVerification();
                                                setState(() {
                                                  _model.loading = false;
                                                });
                                                if (animationsMap[
                                                        'imageOnActionTriggerAnimation'] !=
                                                    null) {
                                                  animationsMap[
                                                          'imageOnActionTriggerAnimation']!
                                                      .controller
                                                      .stop();
                                                }

                                                context.pushNamedAuth(
                                                  'onboarding1',
                                                  context.mounted,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 250),
                                                    ),
                                                  },
                                                );

                                                await requestPermission(
                                                    notificationsPermission);
                                              }

                                              if (animationsMap[
                                                      'imageOnActionTriggerAnimation'] !=
                                                  null) {
                                                animationsMap[
                                                        'imageOnActionTriggerAnimation']!
                                                    .controller
                                                    .stop();
                                              }

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/buttonbg.png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (!_model.loading)
                                                    Text(
                                                      'Sign Up',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/logo_mark.png',
                                                      width: 35.0,
                                                      height: 35.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'imageOnActionTriggerAnimation']!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 30.0, 30.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Already have an account? ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'login',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .bottomToTop,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Text(
                                                'Log In',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
