import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/finalcomponents/menu/menu_widget.dart';
import '/finalcomponents/nav_yoga/nav_yoga_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'yoga_model.dart';
export 'yoga_model.dart';

class YogaWidget extends StatefulWidget {
  const YogaWidget({super.key});

  @override
  State<YogaWidget> createState() => _YogaWidgetState();
}

class _YogaWidgetState extends State<YogaWidget> {
  late YogaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YogaModel());

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
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            17.0, 12.0, 17.0, 12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GradientText(
                                      'Yoga',
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 195.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .txtfieldbg,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 12.0, 15.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'You might feel easily\nirritated today, this\nroutine will reduce\nstress',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Full Body',
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
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Yoga',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 76.0,
                                                                height: 22.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .asset(
                                                                      'assets/images/buttonbg.png',
                                                                    ).image,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Relaxed',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/yogabg.png',
                                                  height: 195.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 86.0,
                                    constraints: const BoxConstraints(
                                      minWidth: double.infinity,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .borderfill,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          11.0, 14.0, 11.0, 14.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Vitality',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              LinearPercentIndicator(
                                                percent: valueOrDefault<double>(
                                                  valueOrDefault<double>(
                                                        functions
                                                            .stringToDouble(
                                                                valueOrDefault<
                                                                    String>(
                                                          getJsonField(
                                                            FFAppState().stats,
                                                            r'''$.response.bot_response.health.score''',
                                                          )?.toString(),
                                                          '0',
                                                        )),
                                                        0.0,
                                                      ) /
                                                      100,
                                                  0.0,
                                                ),
                                                width: 90.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                barRadius:
                                                    const Radius.circular(20.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  '${valueOrDefault<String>(
                                                    getJsonField(
                                                      FFAppState().stats,
                                                      r'''$.response.bot_response.health.score''',
                                                    )?.toString(),
                                                    '0',
                                                  )}%',
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0xFF959595),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Strength',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              LinearPercentIndicator(
                                                percent: valueOrDefault<double>(
                                                  functions.stringToDouble(
                                                          valueOrDefault<
                                                              String>(
                                                        getJsonField(
                                                          FFAppState().stats,
                                                          r'''$.response.bot_response.physique.score''',
                                                        )?.toString(),
                                                        '0',
                                                      )) /
                                                      100,
                                                  0.0,
                                                ),
                                                width: 90.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                barRadius:
                                                    const Radius.circular(20.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  '${valueOrDefault<String>(
                                                    getJsonField(
                                                      FFAppState().stats,
                                                      r'''$.response.bot_response.physique.score''',
                                                    )?.toString(),
                                                    '0',
                                                  )}%',
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0xFF959595),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Energy',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                              LinearPercentIndicator(
                                                percent: valueOrDefault<double>(
                                                  functions.stringToDouble(
                                                          valueOrDefault<
                                                              String>(
                                                        getJsonField(
                                                          FFAppState().stats,
                                                          r'''$.response.bot_response.total_score.score''',
                                                        )?.toString(),
                                                        '0',
                                                      )) /
                                                      100,
                                                  0.0,
                                                ),
                                                width: 90.0,
                                                lineHeight: 6.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                barRadius:
                                                    const Radius.circular(20.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  '${valueOrDefault<String>(
                                                    getJsonField(
                                                      FFAppState().stats,
                                                      r'''$.response.bot_response.total_score.score''',
                                                    )?.toString(),
                                                    '0',
                                                  )}%',
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0xFF959595),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'Type',
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
                                    15.0, 0.0, 15.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.type = 'All';
                                          });
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            height: 33.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.type == 'All'
                                                    ? const Color(0xFFFFB421)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .borderfill,
                                                FlutterFlowTheme.of(context)
                                                    .borderfill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'All',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.type = 'Full Body';
                                          });
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            height: 33.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.type == 'Full Body'
                                                    ? const Color(0xFFFFB421)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .borderfill,
                                                FlutterFlowTheme.of(context)
                                                    .borderfill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'Full Body',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.type = 'Upper';
                                          });
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            height: 33.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.type == 'Upper'
                                                    ? const Color(0xFFFFB421)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .borderfill,
                                                FlutterFlowTheme.of(context)
                                                    .borderfill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'Upper',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.type = 'Lower';
                                        });
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Container(
                                          height: 33.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              _model.type == 'Lower'
                                                  ? const Color(0xFFFFB421)
                                                  : FlutterFlowTheme.of(context)
                                                      .borderfill,
                                              FlutterFlowTheme.of(context)
                                                  .borderfill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Text(
                                              'Lower',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                      'Recommended Routines',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: const Color(0xFFD9D9D9),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Opacity(
                                      opacity: 0.0,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'View All',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: const Color(0xFF7A7A7A),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color: Color(0xFF7A7A7A),
                                              size: 28.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<List<YogaRoutineRecord>>(
                                    stream: queryYogaRoutineRecord(
                                      queryBuilder: (yogaRoutineRecord) =>
                                          yogaRoutineRecord.where(
                                        'recoZodiac',
                                        arrayContains: valueOrDefault(
                                                    currentUserDocument
                                                        ?.sunSign,
                                                    '') !=
                                                ''
                                            ? valueOrDefault(
                                                currentUserDocument?.sunSign,
                                                '')
                                            : null,
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
                                      List<YogaRoutineRecord>
                                          containerYogaRoutineRecordList =
                                          snapshot.data!;
                                      return Container(
                                        width: double.infinity,
                                        height: 150.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final list = functions
                                                .routineFilter(
                                                    containerYogaRoutineRecordList
                                                        .toList(),
                                                    _model.type,
                                                    _model.difficulty)
                                                .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: list.length,
                                              itemBuilder:
                                                  (context, listIndex) {
                                                final listItem =
                                                    list[listIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
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
                                                        'routine',
                                                        queryParameters: {
                                                          'doc': serializeParam(
                                                            listItem,
                                                            ParamType.Document,
                                                          ),
                                                          'difficulty':
                                                              serializeParam(
                                                            listItem.difficulty,
                                                            ParamType.String,
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
                                                        width: 105.0,
                                                        height: 152.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .background,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.contain,
                                                            image:
                                                                Image.network(
                                                              listItem.imageUrl,
                                                            ).image,
                                                          ),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              listItem
                                                                  .routineName,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'Difficulty',
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
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.difficulty = 'All';
                                          });
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            height: 33.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.difficulty == 'All'
                                                    ? const Color(0xFFFFB421)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .borderfill,
                                                FlutterFlowTheme.of(context)
                                                    .borderfill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'All',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.difficulty = 'Relaxed';
                                          });
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            height: 33.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.difficulty == 'Relaxed'
                                                    ? const Color(0xFFFFB421)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .borderfill,
                                                FlutterFlowTheme.of(context)
                                                    .borderfill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'Relaxed',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.difficulty = 'Mild';
                                          });
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            height: 33.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.difficulty == 'Mild'
                                                    ? const Color(0xFFFFB421)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .borderfill,
                                                FlutterFlowTheme.of(context)
                                                    .borderfill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'Mild',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.difficulty = 'Advanced';
                                        });
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Container(
                                          height: 33.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              _model.difficulty == 'Advanced'
                                                  ? const Color(0xFFFFB421)
                                                  : FlutterFlowTheme.of(context)
                                                      .borderfill,
                                              FlutterFlowTheme.of(context)
                                                  .borderfill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Text(
                                              'Advanced',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                      'Chakra Routines',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: const Color(0xFFD9D9D9),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Opacity(
                                      opacity: 0.0,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'View All',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: const Color(0xFF7A7A7A),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color: Color(0xFF7A7A7A),
                                              size: 28.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<List<YogaRecord>>(
                                    stream: queryYogaRecord(
                                      queryBuilder: (yogaRecord) => yogaRecord
                                          .where(
                                            'zodiacName',
                                            isEqualTo: valueOrDefault(
                                                currentUserDocument?.sunSign,
                                                ''),
                                          )
                                          .where(
                                            'lordOfZodiac',
                                            isEqualTo: 'Sun',
                                          ),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              size: 30.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<YogaRecord> containerYogaRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerYogaRecord =
                                          containerYogaRecordList.isNotEmpty
                                              ? containerYogaRecordList.first
                                              : null;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'PlanetRoutines',
                                            queryParameters: {
                                              'doc': serializeParam(
                                                containerYogaRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'doc': containerYogaRecord,
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                                duration:
                                                    Duration(milliseconds: 100),
                                              ),
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xFFFDC85F),
                                                  Color(0xFFFFBE3F),
                                                  Color(0xFFF6A400)
                                                ],
                                                stops: [0.0, 0.5, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 15.0, 8.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        () {
                                                          if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Aries') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/eaqq541q4jlr/aries.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Leo') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/fbj062t4cwed/leo.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Sagittarius') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/3vippjnshld1/sagittarius.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Gemini') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/m9hlc16863fx/gemini.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Libra') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/k1jzvhck390m/libra.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Aquarius') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ou1tff21h8n9/aquarius.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Cancer') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/m2kx038i3tdp/cancer.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Scorpio') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/sfcv01yaz4al/scorpio.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Pisces') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/0pvoduhrj75o/pisces.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Taurus') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/r2e2p59ll9w6/taurus.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Virgo') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/5gem30vag9ka/virgo.png';
                                                          } else if (containerYogaRecord
                                                                  ?.zodiacName ==
                                                              'Capricorn') {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/7en3u9pz4353/capricon.png';
                                                          } else {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/sfcv01yaz4al/scorpio.png';
                                                          }
                                                        }(),
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/sfcv01yaz4al/scorpio.png',
                                                      ),
                                                      width: 48.0,
                                                      height: 48.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Sun',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Libre Franklin',
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '(Recommended)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Libre Franklin',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                containerYogaRecord!
                                                                    .details,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Libre Franklin',
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .keyboard_arrow_right_rounded,
                                                    color: Color(0xFF7A7A7A),
                                                    size: 30.0,
                                                  ),
                                                ],
                                              ),
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
                                    0.0, 0.0, 0.0, 100.0),
                                child: StreamBuilder<List<YogaRecord>>(
                                  stream: queryYogaRecord(),
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
                                    List<YogaRecord> listViewYogaRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewYogaRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewYogaRecord =
                                            listViewYogaRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'PlanetRoutines',
                                                queryParameters: {
                                                  'doc': serializeParam(
                                                    listViewYogaRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'doc': listViewYogaRecord,
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .borderfill,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 15.0, 8.0,
                                                          15.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Aries') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/dy68n0aukxte/ariesb.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Leo') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/rqyowm39i9n4/leob.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Sagittarius') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/teq6n9gwfmnm/sagittariusb.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Gemini') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/icbkj7q8wtev/geminib.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Libra') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/cnxlswadygwp/librab.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Aquarius') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/c31yj9e71uqz/aquariusb.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Cancer') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/wwl9wvyt4oyh/cancerb.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Scorpio') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/x82stnk777kj/scorpiob.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Pisces') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ohjll2c61h2a/piscesb.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Taurus') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/ig3lot45hd0p/taurusb.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Virgo') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/j98x8zu5nirp/virgob.png';
                                                              } else if (listViewYogaRecord
                                                                      .zodiacName ==
                                                                  'Capricorn') {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/2s21ij20fstl/capriconb.png';
                                                              } else {
                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/admin-fi625i/assets/xvkxhy7p7rq9/scorpiob.png';
                                                              }
                                                            }(),
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/admin-fi625i/assets/xvkxhy7p7rq9/scorpiob.png',
                                                          ),
                                                          width: 48.0,
                                                          height: 48.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    listViewYogaRecord
                                                                        .lordOfZodiac,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Libre Franklin',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      listViewYogaRecord
                                                                          .zodiacName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Libre Franklin',
                                                                            color:
                                                                                const Color(0xFF7A7A7A),
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listViewYogaRecord
                                                                        .details,
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Libre Franklin',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .keyboard_arrow_right_rounded,
                                                        color:
                                                            Color(0xFF7A7A7A),
                                                        size: 30.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
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
                          model: _model.navYogaModel,
                          updateCallback: () => setState(() {}),
                          child: const NavYogaWidget(),
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
