import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/finalcomponents/menu/menu_widget.dart';
import '/finalcomponents/nav_home/nav_home_widget.dart';
import '/finalcomponents/subcribe/subcribe_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    bool? gSignIn,
  }) : gSignIn = gSignIn ?? false;

  final bool gSignIn;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((currentUserEmail == FFAppState().email) &&
          (functions.dateToString(getCurrentTimestamp) ==
              FFAppState().upDate))) {
        _model.transiRep = await PersonalCharacteristicsCall.call(
          dob: dateTimeFormat('dd/MM/yyyy', getCurrentTimestamp),
          tob: '09:05',
          lat: 24.57,
          lon: 67.4,
          tz: 5.0,
          lang: 'en',
        );
        if ((_model.transiRep?.succeeded ?? true)) {
          setState(() {
            FFAppState().astroEvent = (_model.transiRep?.jsonBody ?? '');
            FFAppState().zodiacToday =
                PersonalCharacteristicsCall.currentZodiac(
              (_model.transiRep?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().planetToday = PersonalCharacteristicsCall.lordOfZodiac(
              (_model.transiRep?.jsonBody ?? ''),
            )!
                .toList()
                .cast<String>();
          });
        }
        _model.apiResultrsb = await VediPredictionDailySunCall.call(
          lang: 'en',
          zodiac:
              valueOrDefault(currentUserDocument?.zodiacNumber, 0).toString(),
          type: 'small',
          date: dateTimeFormat('dd/MM/yyyy', getCurrentTimestamp),
          showSame: false,
          split: true,
        );
        if ((_model.apiResultrsb?.succeeded ?? true)) {
          setState(() {
            FFAppState().stats = (_model.apiResultrsb?.jsonBody ?? '');
          });
        }
        _model.apiResultgln = await MoonPhaseVediAPICall.call(
          date: dateTimeFormat('dd/MM/yyyy', getCurrentTimestamp),
          tz: valueOrDefault(currentUserDocument?.tZone, 0.0),
          lang: 'en',
        );
        if ((_model.apiResultgln?.succeeded ?? true)) {
          setState(() {
            FFAppState().lunar = (_model.apiResultgln?.jsonBody ?? '');
            FFAppState().moonState = MoonPhaseVediAPICall.moonState(
              (_model.apiResultgln?.jsonBody ?? ''),
            )!
                .toList()
                .cast<String>();
            FFAppState().moonStateDate = MoonPhaseVediAPICall.moonStateDate(
              (_model.apiResultgln?.jsonBody ?? ''),
            )!
                .toList()
                .cast<String>();
          });
        }
        setState(() {
          FFAppState().upDate = functions.dateToString(getCurrentTimestamp);
          FFAppState().email = currentUserEmail;
        });
      }
    });

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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(17.0, 12.0, 17.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const MenuWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'profile',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 250),
                              ),
                            },
                          );
                        },
                        child: Container(
                          width: 37.0,
                          height: 37.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              currentUserPhoto,
                              'https://firebasestorage.googleapis.com/v0/b/astraline-c5463.appspot.com/o/no-photo-available-icon-20.jpg?alt=media&token=0774d171-edb2-4630-9846-4e562d5e7555',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            17.0, 12.0, 17.0, 12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GradientText(
                                    'Your Reports',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    colors: const [
                                      Color(0xFFFDC85F),
                                      Color(0xFFFFBE3F),
                                      Color(0xFFF6A400)
                                    ],
                                    gradientDirection: GradientDirection.ttb,
                                    gradientType: GradientType.linear,
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if ((currentUserDocument?.selectedPlan !=
                                              null) &&
                                          (currentUserDocument?.selectedPlan !=
                                              FFAppState().selectedPlan)) {
                                        context.pushNamed('calendarview');
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SubcribeWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'TODAY',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color: const Color(0xFF7A7A7A),
                                                fontSize: 12.0,
                                              ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF7A7A7A),
                                            size: 30.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child:
                                    StreamBuilder<List<QuoteCollectionsRecord>>(
                                  stream: queryQuoteCollectionsRecord(
                                    queryBuilder: (quoteCollectionsRecord) =>
                                        quoteCollectionsRecord.orderBy(
                                            'createdAt',
                                            descending: true),
                                    singleRecord: true,
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
                                    List<QuoteCollectionsRecord>
                                        containerQuoteCollectionsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerQuoteCollectionsRecord =
                                        containerQuoteCollectionsRecordList
                                                .isNotEmpty
                                            ? containerQuoteCollectionsRecordList
                                                .first
                                            : null;
                                    return Material(
                                      color: Colors.transparent,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .borderfill,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/icomoon-free_quotes-right.png',
                                                  width: 16.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Affirmation',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerQuoteCollectionsRecord
                                                                ?.quoteOfTheDay,
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
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
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => StreamBuilder<
                                      List<OutputCollectionRecord>>(
                                    stream: queryOutputCollectionRecord(
                                      queryBuilder: (outputCollectionRecord) =>
                                          outputCollectionRecord.where(
                                        'ascendant',
                                        isEqualTo: valueOrDefault(
                                            currentUserDocument?.ascendantSign,
                                            ''),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              size: 30.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<OutputCollectionRecord>
                                          containerOutputCollectionRecordList =
                                          snapshot.data!;
                                      return Material(
                                        color: Colors.transparent,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .borderfill,
                                              width: 3.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 10.0, 4.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/icomoon-free_quotes-right.png',
                                                    width: 16.0,
                                                    height: 16.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Transit report',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            functions
                                                                .properText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  containerOutputCollectionRecordList
                                                                      .where((e) =>
                                                                          e.timestamp ==
                                                                          dateTimeFormat(
                                                                              'dd/MM/yyyy',
                                                                              functions.lastDate(containerOutputCollectionRecordList.map((e) => e.timestamp).toList())))
                                                                      .toList()
                                                                      .first
                                                                      .response,
                                                                  '0',
                                                                ))
                                                                .maybeHandleOverflow(
                                                                  maxChars: 175,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if ((currentUserDocument
                                                                          ?.selectedPlan !=
                                                                      null) &&
                                                                  (currentUserDocument
                                                                          ?.selectedPlan !=
                                                                      FFAppState()
                                                                          .selectedPlan)) {
                                                                context
                                                                    .pushNamed(
                                                                  'transitreport',
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .rightToLeft,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              250),
                                                                    ),
                                                                  },
                                                                );
                                                              } else {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              const SubcribeWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              }
                                                            },
                                                            child: GradientText(
                                                              'Click Here for Your Extended\nTransit Report',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .midyellow,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                              colors: [
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightyellow,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightyellow,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .darkyellow
                                                              ],
                                                              gradientDirection:
                                                                  GradientDirection
                                                                      .ttb,
                                                              gradientType:
                                                                  GradientType
                                                                      .linear,
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
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Container(
                                  width: 283.0,
                                  height: 283.0,
                                  decoration: const BoxDecoration(),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => SizedBox(
                                      width: double.infinity,
                                      height: 283.0,
                                      child: custom_widgets.SvgDisplayScreen(
                                        width: double.infinity,
                                        height: 283.0,
                                        svgContent: valueOrDefault(
                                            currentUserDocument?.svgContent,
                                            ''),
                                        bgColor: FlutterFlowTheme.of(context)
                                            .lightyellow,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 78.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).borderfill,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Sun Sign',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 8.0,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Aries') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/dy68n0aukxte/ariesb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Leo') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/rqyowm39i9n4/leob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Sagittarius') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/teq6n9gwfmnm/sagittariusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Gemini') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/icbkj7q8wtev/geminib.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Libra') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/cnxlswadygwp/librab.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Aquarius') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/c31yj9e71uqz/aquariusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Cancer') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/wwl9wvyt4oyh/cancerb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Scorpio') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Pisces') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ohjll2c61h2a/piscesb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Taurus') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ig3lot45hd0p/taurusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Virgo') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/j98x8zu5nirp/virgob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sunSign,
                                                                '') ==
                                                            'Capricorn') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        } else {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        }
                                                      }(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png',
                                                    ),
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.sunSign,
                                                        ''),
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Moon Sign',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 8.0,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Aries') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/dy68n0aukxte/ariesb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Leo') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/rqyowm39i9n4/leob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Sagittarius') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/teq6n9gwfmnm/sagittariusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Gemini') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/icbkj7q8wtev/geminib.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Libra') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/cnxlswadygwp/librab.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Aquarius') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/c31yj9e71uqz/aquariusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Cancer') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/wwl9wvyt4oyh/cancerb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Scorpio') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Pisces') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ohjll2c61h2a/piscesb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Taurus') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ig3lot45hd0p/taurusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Virgo') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/j98x8zu5nirp/virgob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.moonSign,
                                                                '') ==
                                                            'Capricorn') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        } else {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        }
                                                      }(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png',
                                                    ),
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.moonSign,
                                                        ''),
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Ascendant',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 8.0,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Aries') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/dy68n0aukxte/ariesb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Leo') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/rqyowm39i9n4/leob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Sagittarius') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/teq6n9gwfmnm/sagittariusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Gemini') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/icbkj7q8wtev/geminib.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Libra') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/cnxlswadygwp/librab.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Aquarius') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/c31yj9e71uqz/aquariusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Cancer') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/wwl9wvyt4oyh/cancerb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Scorpio') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Pisces') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ohjll2c61h2a/piscesb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Taurus') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ig3lot45hd0p/taurusb.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Virgo') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/j98x8zu5nirp/virgob.png';
                                                        } else if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.ascendantSign,
                                                                '') ==
                                                            'Capricorn') {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        } else {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                        }
                                                      }(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png',
                                                    ),
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.ascendantSign,
                                                        ''),
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 10.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Element',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 8.0,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if ((valueOrDefault(currentUserDocument?.elementSign, '') == 'Aries') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Leo') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Sagittarius')) {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/jhzt1kazw8qw/fire.png';
                                                        } else if ((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Taurus') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Virgo') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Capricorn')) {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/oq741kx4jw5c/earth.png';
                                                        } else if ((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Gemini') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Libra') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Aquarius')) {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/8eu8o5180cma/air.png';
                                                        } else if ((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Cancer') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Scorpio') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.elementSign,
                                                                    '') ==
                                                                'Pisces')) {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/1zgzm9smf8ww/ph_triangle-bold.png';
                                                        } else {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/1zgzm9smf8ww/ph_triangle-bold.png';
                                                        }
                                                      }(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/1zgzm9smf8ww/ph_triangle-bold.png',
                                                    ),
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.elementSign,
                                                        ''),
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 10.0,
                                                      ),
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
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    'Astrological Events',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: const Color(0xFFD9D9D9),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .borderfill,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                                'MMMMd', getCurrentTimestamp),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: const Color(0xFF7A7A7A),
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[0]} is in ${FFAppState().zodiacToday[0]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.physique.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[1]} is in ${FFAppState().zodiacToday[1]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.status.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[2]} is in ${FFAppState().zodiacToday[2]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.finances.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[3]} is in ${FFAppState().zodiacToday[3]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.relationship.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[4]} is in ${FFAppState().zodiacToday[4]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.career.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[5]} is in ${FFAppState().zodiacToday[5]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.travel.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[6]} is in ${FFAppState().zodiacToday[6]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.family.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              '${FFAppState().planetToday[7]} is in ${FFAppState().zodiacToday[7]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                FFAppState().stats,
                                                r'''$.response.bot_response.health.split_response''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recommended Poses',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: const Color(0xFFD9D9D9),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'PoseLibrary',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 250),
                                            ),
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('PoseLibrary');
                                            },
                                            child: Text(
                                              'View All',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color: const Color(0xFF7A7A7A),
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context
                                                    .pushNamed('PoseLibrary');
                                              },
                                              child: const Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color: Color(0xFF7A7A7A),
                                                size: 28.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<PosesRecord>>(
                                  stream: queryPosesRecord(
                                    queryBuilder: (posesRecord) =>
                                        posesRecord.where(
                                      'recoZodiac',
                                      arrayContains: valueOrDefault(
                                          currentUserDocument?.sunSign, ''),
                                    ),
                                    limit: 3,
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
                                    List<PosesRecord> containerPosesRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Builder(
                                          builder: (context) {
                                            final list =
                                                containerPosesRecordList
                                                    .toList();
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                  list.length, (listIndex) {
                                                final listItem =
                                                    list[listIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'PoseDetails',
                                                        queryParameters: {
                                                          'doc': serializeParam(
                                                            listItem,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'doc': listItem,
                                                        },
                                                      );
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 4.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Container(
                                                        width: 104.0,
                                                        height: 123.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .borderfill,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.contain,
                                                            image:
                                                                Image.network(
                                                              listItem.imageUrl,
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Stack(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Text(
                                                                listItem.pose,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Libre Franklin',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'Lunar Calendar',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: const Color(0xFFD9D9D9),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 100.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .borderfill,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    50.0, 0.0, 50.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/feMoon0.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            FFAppState().lunar,
                                                            r'''$.response[0].state''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: RichText(
                                                            textScaleFactor:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaleFactor,
                                                            text: TextSpan(
                                                              children: [
                                                                const TextSpan(
                                                                  text: 'in ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    FFAppState()
                                                                            .zodiacToday[
                                                                        valueOrDefault<
                                                                            int>(
                                                                      functions.returnIndex(
                                                                          FFAppState()
                                                                              .planetToday
                                                                              .toList(),
                                                                          'Moon'),
                                                                      0,
                                                                    )],
                                                                    '0',
                                                                  ),
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFFFFBE3F),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Illumination ${valueOrDefault<String>(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .lunar,
                                                              r'''$.response[0].luminance''',
                                                            )?.toString(),
                                                            '0',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            thickness: 1.0,
                                            color: Color(0xFF434343),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 10.0, 24.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/semi2.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'MMMd',
                                                            functions.stringToDate(FFAppState()
                                                                    .moonStateDate[
                                                                functions.returnIndex(
                                                                    FFAppState()
                                                                        .moonState
                                                                        .toList(),
                                                                    'last quarter')])),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/semi3_1.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'MMMd',
                                                            functions.stringToDate(FFAppState()
                                                                    .moonStateDate[
                                                                functions.returnIndex(
                                                                    FFAppState()
                                                                        .moonState
                                                                        .toList(),
                                                                    'fullmoon')])),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/semi2_(1).png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'MMMd',
                                                            functions.stringToDate(FFAppState()
                                                                    .moonStateDate[
                                                                functions.returnIndex(
                                                                    FFAppState()
                                                                        .moonState
                                                                        .toList(),
                                                                    'quarter')])),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/semi1.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'MMMd',
                                                            functions.stringToDate(FFAppState()
                                                                    .moonStateDate[
                                                                functions.returnIndex(
                                                                    FFAppState()
                                                                        .moonState
                                                                        .toList(),
                                                                    'newmoon')])),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: wrapWithModel(
                          model: _model.navHomeModel,
                          updateCallback: () => setState(() {}),
                          child: const NavHomeWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
