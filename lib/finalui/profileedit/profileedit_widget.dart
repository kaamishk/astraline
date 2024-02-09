import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'profileedit_model.dart';
export 'profileedit_model.dart';

class ProfileeditWidget extends StatefulWidget {
  const ProfileeditWidget({super.key});

  @override
  State<ProfileeditWidget> createState() => _ProfileeditWidgetState();
}

class _ProfileeditWidgetState extends State<ProfileeditWidget>
    with TickerProviderStateMixin {
  late ProfileeditModel _model;

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
    _model = createModel(context, () => ProfileeditModel());

    _model.textController1 ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldFocusNode ??= FocusNode();

    _model.birthCountryController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.birthCountry, ''));

    _model.birthStateController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.birthState, ''));

    _model.birthPlaceController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.birthPlace, ''));

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
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(17.0, 12.0, 17.0, 12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'settings',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 250),
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.arrow_back_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 24.0, 0.0),
                                  child: Text(
                                    'Profile Settings',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => ClipRRect(
                                    borderRadius: BorderRadius.circular(27.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        _model.uploadedFileUrl != ''
                                            ? _model.uploadedFileUrl
                                            : currentUserPhoto,
                                        'https://firebasestorage.googleapis.com/v0/b/astraline-c5463.appspot.com/o/no-photo-available-icon-20.jpg?alt=media&token=0774d171-edb2-4630-9846-4e562d5e7555',
                                      ),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.31, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 72.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).iconbutton,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 35.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).iconbutton,
                                    icon: Icon(
                                      Icons.camera_enhance_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
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
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
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
                                        } else {
                                          setState(() {});
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
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 48.0, 0.0, 8.0),
                            child: Text(
                              'Name',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Container(
                            width: double.infinity,
                            height: 32.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) => TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: 'Name',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF676767),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .midyellow,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                  suffixIcon: Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 34.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Text(
                                            'Email',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        child: Container(
                                          width: double.infinity,
                                          height: 32.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    currentUserEmail,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons.edit_off,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightcolor,
                                                    size: 20.0,
                                                  ),
                                                ],
                                              ),
                                              const Divider(
                                                thickness: 1.0,
                                                color: Color(0xFF676767),
                                              ),
                                            ],
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 34.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Birthdate',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          child: Container(
                                            width: double.infinity,
                                            height: 32.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Text(
                                                            dateTimeFormat(
                                                                            'yMd',
                                                                            _model
                                                                                .datePicked1) !=
                                                                        ''
                                                                ? dateTimeFormat(
                                                                    'yMd',
                                                                    _model
                                                                        .datePicked1)
                                                                : dateTimeFormat(
                                                                    'yMd',
                                                                    currentUserDocument!
                                                                        .birthDate!),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .calendar_month_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFF676767),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Birthtime',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          child: Container(
                                            width: double.infinity,
                                            height: 32.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Text(
                                                            dateTimeFormat(
                                                                            'jm',
                                                                            _model
                                                                                .datePicked2) !=
                                                                        ''
                                                                ? dateTimeFormat(
                                                                    'jm',
                                                                    _model
                                                                        .datePicked2)
                                                                : dateTimeFormat(
                                                                    'jm',
                                                                    currentUserDocument!
                                                                        .birthTime!),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.access_time,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFF676767),
                                                ),
                                              ],
                                            ),
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
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Birth Country',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Container(
                            width: double.infinity,
                            height: 32.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  FutureBuilder<List<CountryRow>>(
                                future: CountryTable().queryRows(
                                  queryFn: (q) =>
                                      q.order('countryCode', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .midyellow,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CountryRow> birthCountryCountryRowList =
                                      snapshot.data!;
                                  return Autocomplete<String>(
                                    initialValue: TextEditingValue(
                                        text: valueOrDefault(
                                            currentUserDocument?.birthCountry,
                                            '')),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
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
                                        textFieldKey: _model.birthCountryKey,
                                        textController:
                                            _model.birthCountryController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: const TextStyle(),
                                        textHighlightStyle: const TextStyle(),
                                        elevation: 4.0,
                                        optionBackgroundColor:
                                            const Color(0x00000000),
                                        optionHighlightColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        maxHeight: 100.0,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      setState(() =>
                                          _model.birthCountrySelectedOption =
                                              selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      _model.birthCountryFocusNode = focusNode;

                                      _model.birthCountryController =
                                          textEditingController;
                                      return TextFormField(
                                        key: _model.birthCountryKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.birthCountryController',
                                          const Duration(milliseconds: 2),
                                          () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: 'Birth Place',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF676767),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          suffixIcon: Icon(
                                            Icons.mode_edit_outline_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
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
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Birth State',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Container(
                            width: double.infinity,
                            height: 32.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  FutureBuilder<List<StatesRow>>(
                                future: StatesTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'countryCode',
                                        _model.birthCountryController.text,
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
                                          color: FlutterFlowTheme.of(context)
                                              .midyellow,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<StatesRow> birthStateStatesRowList =
                                      snapshot.data!;
                                  return Autocomplete<String>(
                                    initialValue: TextEditingValue(
                                        text: valueOrDefault(
                                            currentUserDocument?.birthState,
                                            '')),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
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
                                        textFieldKey: _model.birthStateKey,
                                        textController:
                                            _model.birthStateController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textHighlightStyle: const TextStyle(),
                                        elevation: 4.0,
                                        optionBackgroundColor:
                                            const Color(0x00000000),
                                        optionHighlightColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        maxHeight: 100.0,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      setState(() =>
                                          _model.birthStateSelectedOption =
                                              selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      _model.birthStateFocusNode = focusNode;

                                      _model.birthStateController =
                                          textEditingController;
                                      return TextFormField(
                                        key: _model.birthStateKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.birthStateController',
                                          const Duration(milliseconds: 2),
                                          () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: 'Birth Place',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF676767),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          suffixIcon: Icon(
                                            Icons.mode_edit_outline_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
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
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Birth Place',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Container(
                            width: double.infinity,
                            height: 32.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  FutureBuilder<List<GeoDataRow>>(
                                future: GeoDataTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'country',
                                        _model.birthCountryController.text,
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
                                          color: FlutterFlowTheme.of(context)
                                              .midyellow,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<GeoDataRow> birthPlaceGeoDataRowList =
                                      snapshot.data!;
                                  return Autocomplete<String>(
                                    initialValue: TextEditingValue(
                                        text: valueOrDefault(
                                            currentUserDocument?.birthPlace,
                                            '')),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
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
                                        textFieldKey: _model.birthPlaceKey,
                                        textController:
                                            _model.birthPlaceController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textHighlightStyle: const TextStyle(),
                                        elevation: 4.0,
                                        optionBackgroundColor:
                                            const Color(0x00000000),
                                        optionHighlightColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        maxHeight: 100.0,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      setState(() =>
                                          _model.birthPlaceSelectedOption =
                                              selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      _model.birthPlaceFocusNode = focusNode;

                                      _model.birthPlaceController =
                                          textEditingController;
                                      return TextFormField(
                                        key: _model.birthPlaceKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.birthPlaceController',
                                          const Duration(milliseconds: 2),
                                          () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: 'Birth Place',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF676767),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          suffixIcon: Icon(
                                            Icons.mode_edit_outline_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
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
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 8.0),
                            child: Text(
                              'Gender',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(
                              _model.dropDownValue ??= valueOrDefault(
                                  currentUserDocument?.gender, ''),
                            ),
                            options: const ['Female', 'Male', 'Other'],
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue = val),
                            width: double.infinity,
                            height: 31.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).lightcolor,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).background,
                            elevation: 2.0,
                            borderColor: const Color(0x00E0E3E7),
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(17.0, 30.0, 17.0, 12.0),
                  child: FutureBuilder<List<GeoDataRow>>(
                    future: GeoDataTable().querySingleRow(
                      queryFn: (q) => q
                          .eq(
                            'country',
                            _model.birthCountryController.text,
                          )
                          .eq(
                            'admin_name',
                            _model.birthStateController.text,
                          )
                          .eq(
                            'city',
                            _model.birthPlaceController.text,
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
                              color: FlutterFlowTheme.of(context).midyellow,
                              size: 30.0,
                            ),
                          ),
                        );
                      }
                      List<GeoDataRow> containerGeoDataRowList = snapshot.data!;
                      final containerGeoDataRow =
                          containerGeoDataRowList.isNotEmpty
                              ? containerGeoDataRowList.first
                              : null;
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.loading = true;
                          });
                          if (animationsMap['imageOnActionTriggerAnimation'] !=
                              null) {
                            animationsMap[
                                    'imageOnActionTriggerAnimation']!
                                .controller
                              ..reset()
                              ..repeat();
                          }
                          _model.timeZoneUpdate2 =
                              await GeoCordinatesVediAPICall.call(
                            city: _model.birthPlaceController.text,
                          );
                          _model.birthDetail2 =
                              await BirthDetailVedicApiCall.call(
                            dob: _model.datePicked1 != null
                                ? dateTimeFormat(
                                    'dd/MM/yyyy', _model.datePicked1)
                                : dateTimeFormat('dd/MM/yyyy',
                                    currentUserDocument?.birthDate),
                            tob: _model.datePicked2 != null
                                ? dateTimeFormat('HH:MM', _model.datePicked2)
                                : dateTimeFormat(
                                    'HH:MM', currentUserDocument?.birthTime),
                            lat: containerGeoDataRow?.lat,
                            lon: containerGeoDataRow?.lng,
                            tz: functions.stringToDouble(getJsonField(
                              (_model.timeZoneUpdate2?.jsonBody ?? ''),
                              r'''$.response[0].tz''',
                            ).toString()),
                            lang: 'en',
                          );
                          _model.wheel2 = await VedicChartCall.call(
                            dob: _model.datePicked1 != null
                                ? dateTimeFormat(
                                    'dd/MM/yyyy', _model.datePicked1)
                                : dateTimeFormat('dd/MM/yyyy',
                                    currentUserDocument?.birthDate),
                            tob: _model.datePicked2 != null
                                ? dateTimeFormat('HH:MM', _model.datePicked2)
                                : dateTimeFormat(
                                    'HH:MM', currentUserDocument?.birthTime),
                            lat: containerGeoDataRow?.lat,
                            lon: containerGeoDataRow?.lng,
                            tz: functions.stringToDouble(getJsonField(
                              (_model.timeZoneUpdate2?.jsonBody ?? ''),
                              r'''$.response[0].tz''',
                            ).toString()),
                            lang: 'en',
                            color: '%238A0009',
                            style: 'north',
                            div: 'D1',
                            format: 'base64',
                          );
                          _model.characteristics2 =
                              await PersonalCharacteristicsCall.call(
                            dob: dateTimeFormat(
                                'dd/MM/yyyy',
                                _model.datePicked1 ?? currentUserDocument?.birthDate),
                            tob: dateTimeFormat(
                                'HH:MM',
                                _model.datePicked2 ?? currentUserDocument?.birthTime),
                            lat: containerGeoDataRow?.lat,
                            lon: containerGeoDataRow?.lng,
                            tz: functions.stringToDouble(getJsonField(
                              (_model.timeZoneUpdate2?.jsonBody ?? ''),
                              r'''$.response[0].tz''',
                            ).toString()),
                          );

                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              displayName: valueOrDefault<String>(
                                _model.textController1.text,
                                '0',
                              ),
                              birthDate: _model.datePicked1 ?? currentUserDocument?.birthDate,
                              birthTime: _model.datePicked2 ?? currentUserDocument?.birthTime,
                              birthPlace: valueOrDefault<String>(
                                _model.birthPlaceController.text,
                                '0',
                              ),
                              photoUrl: valueOrDefault<String>(
                                _model.uploadedFileUrl != ''
                                    ? _model.uploadedFileUrl
                                    : currentUserPhoto,
                                '0',
                              ),
                              sunSign: valueOrDefault<String>(
                                BirthDetailVedicApiCall.zodiacList(
                                  (_model.birthDetail2?.jsonBody ?? ''),
                                )?[1],
                                '0',
                              ),
                              moonSign: valueOrDefault<String>(
                                BirthDetailVedicApiCall.zodiacList(
                                  (_model.birthDetail2?.jsonBody ?? ''),
                                )?[2],
                                '0',
                              ),
                              ascendantSign: valueOrDefault<String>(
                                BirthDetailVedicApiCall.zodiacList(
                                  (_model.birthDetail2?.jsonBody ?? ''),
                                )?[0],
                                '0',
                              ),
                              elementSign: valueOrDefault<String>(
                                () {
                                  if ((valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Aries') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Leo') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Sagittarius')) {
                                    return 'Fire';
                                  } else if ((valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Taurus') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Virgo') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Capricorn')) {
                                    return 'Earth';
                                  } else if ((valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Gemini') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Libra') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Aquarius')) {
                                    return 'Air';
                                  } else if ((valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Cancer') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Scorpio') ||
                                      (valueOrDefault<String>(
                                            BirthDetailVedicApiCall.zodiacList(
                                              (_model.birthDetail2?.jsonBody ??
                                                  ''),
                                            )?[1],
                                            '0',
                                          ) ==
                                          'Pisces')) {
                                    return 'Water';
                                  } else {
                                    return '0';
                                  }
                                }(),
                                '0',
                              ),
                              birthChart:
                                  (_model.wheel2?.jsonBody ?? '').toString(),
                              day: valueOrDefault<int>(
                                functions.splitDate(
                                    _model.datePicked1 != null
                                        ? _model.datePicked1!
                                        : currentUserDocument!.birthDate!,
                                    'day'),
                                0,
                              ),
                              month: valueOrDefault<int>(
                                functions.splitDate(
                                    _model.datePicked1 != null
                                        ? _model.datePicked1!
                                        : currentUserDocument!.birthDate!,
                                    'month'),
                                0,
                              ),
                              year: valueOrDefault<int>(
                                functions.splitDate(
                                    _model.datePicked1 != null
                                        ? _model.datePicked1!
                                        : currentUserDocument!.birthDate!,
                                    'year'),
                                0,
                              ),
                              hour: valueOrDefault<int>(
                                functions.spiltTime(
                                    _model.datePicked2 != null
                                        ? _model.datePicked2!
                                        : currentUserDocument!.birthTime!,
                                    'hour'),
                                0,
                              ),
                              min: valueOrDefault<int>(
                                functions.spiltTime(
                                    _model.datePicked2 != null
                                        ? _model.datePicked2!
                                        : currentUserDocument!.birthTime!,
                                    'min'),
                                0,
                              ),
                              lat: valueOrDefault<double>(
                                containerGeoDataRow?.lat,
                                0.0,
                              ),
                              long: valueOrDefault<double>(
                                containerGeoDataRow?.lng,
                                0.0,
                              ),
                              tZone: functions.stringToDouble(getJsonField(
                                (_model.timeZoneUpdate2?.jsonBody ?? ''),
                                r'''$.response[0].tz''',
                              ).toString()),
                              zodiacNumber: valueOrDefault<int>(
                                functions.zodiacNumber(getJsonField(
                                  (_model.birthDetail2?.jsonBody ?? ''),
                                  r'''$.planets[0].sign''',
                                ).toString()),
                                0,
                              ),
                              gender: valueOrDefault<String>(
                                _model.dropDownValue,
                                '0',
                              ),
                              birthCountry: valueOrDefault<String>(
                                _model.birthCountryController.text,
                                '0',
                              ),
                              birthState: valueOrDefault<String>(
                                _model.birthStateController.text,
                                '0',
                              ),
                              svgContent: (_model.wheel2?.bodyText ?? ''),
                            ),
                            ...mapToFirestore(
                              {
                                'currentHouse':
                                    PersonalCharacteristicsCall.currentHouse(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                                'verbalLocation':
                                    PersonalCharacteristicsCall.verbalLocation(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                                'currentZodiac':
                                    PersonalCharacteristicsCall.currentZodiac(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                                'lordOfZodiac':
                                    PersonalCharacteristicsCall.lordOfZodiac(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                                'lordZodiacLocation':
                                    PersonalCharacteristicsCall
                                        .lordZodiacLocation(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                                'lordHouseLocation': PersonalCharacteristicsCall
                                    .lordHouseLocation(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                                'personalisedPrediction':
                                    PersonalCharacteristicsCall
                                        .personalisedPrediction(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                                'lordStrength':
                                    PersonalCharacteristicsCall.lordStrength(
                                  (_model.characteristics2?.jsonBody ?? ''),
                                ),
                              },
                            ),
                          });
                          if (animationsMap['imageOnActionTriggerAnimation'] !=
                              null) {
                            animationsMap['imageOnActionTriggerAnimation']!
                                .controller
                                .stop();
                          }

                          context.pushNamed(
                            'profile',
                            queryParameters: {
                              'status': serializeParam(
                                'updated',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 250),
                              ),
                            },
                          );

                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/buttonbg_new.png',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!_model.loading)
                                Text(
                                  'Update Profile',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/logo_mark.png',
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ).animateOnActionTrigger(
                                animationsMap['imageOnActionTriggerAnimation']!,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
