import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/finalcomponents/menu/menu_widget.dart';
import '/finalcomponents/profileupdated/profileupdated_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    this.status,
  });

  final String? status;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.status == 'updated') {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: const ProfileupdatedWidget(),
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
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

    return Builder(
      builder: (context) => AuthUserStreamWidget(
        builder: (context) => StreamBuilder<List<OutputCollectionRecord>>(
          stream: queryOutputCollectionRecord(
            queryBuilder: (outputCollectionRecord) =>
                outputCollectionRecord.where(
              'ascendant',
              isEqualTo: valueOrDefault(currentUserDocument?.ascendantSign, ''),
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Scaffold(
                backgroundColor: FlutterFlowTheme.of(context).background,
                body: Center(
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).midyellow,
                      size: 30.0,
                    ),
                  ),
                ),
              );
            }
            List<OutputCollectionRecord> profileOutputCollectionRecordList =
                snapshot.data!;
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).background,
                body: SafeArea(
                  top: true,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          child: Image.asset(
                            'assets/images/profile_image.png',
                            width: double.infinity,
                            height: 266.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    17.0, 12.0, 17.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'home',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 250),
                                                  ),
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.arrow_back_ios_rounded,
                                              color: Color(0xFF7A7A7A),
                                              size: 28.0,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 1.0, 0.0),
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
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  const MenuWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Icon(
                                                    Icons.more_vert,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(28.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          currentUserPhoto,
                                          'https://firebasestorage.googleapis.com/v0/b/astraline-c5463.appspot.com/o/no-photo-available-icon-20.jpg?alt=media&token=0774d171-edb2-4630-9846-4e562d5e7555',
                                        ),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          36.0, 30.0, 36.0, 8.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 90.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0x00FFFFFF),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Rounded_Rectangle.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    19.0, 10.0, 19.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Your Signs',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
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
                                                                    return 'https://so\'rage.goo\'gleapis.com/flutterflow-io-6f20.appspot.com/projects/astraline-pry0p9/assets/rqyowm39i9n4/leob.png';
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
                                                              width: 22.0,
                                                              height: 22.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        9.0,
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
                                                                Text(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.sunSign,
                                                                      ''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Libre Franklin',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Sun Sign',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Libre Franklin',
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
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
                                                              width: 22.0,
                                                              height: 22.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        9.0,
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
                                                                Text(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.moonSign,
                                                                      ''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Libre Franklin',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Moon Sign',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Libre Franklin',
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
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
                                              ],
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
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 78.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .borderfill,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 8.0, 32.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Sun Sign',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  fontSize: 8.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.sunSign,
                                                              ''),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Moon Sign',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  fontSize: 8.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.moonSign,
                                                              ''),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Ascendant',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  fontSize: 8.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.ascendantSign,
                                                              ''),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Element',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  fontSize: 8.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if ((valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.elementSign,
                                                                          '') ==
                                                                      'Aries') ||
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
                                                              } else if ((valueOrDefault(currentUserDocument?.elementSign, '') == 'Gemini') ||
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
                                                              } else if ((valueOrDefault(currentUserDocument?.elementSign, '') == 'Cancer') ||
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
                                                      Text(
                                                        valueOrDefault<String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.elementSign,
                                                              ''),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Libre Franklin',
                                                              fontSize: 10.0,
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
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Transit Report',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Libre Franklin',
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  InkWell(
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
                                                        'transitreport',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'See more',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Libre Franklin',
                                                            color: const Color(
                                                                0xFF7A7A7A),
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Text(
                                                  functions
                                                      .properText(
                                                          valueOrDefault<
                                                              String>(
                                                        profileOutputCollectionRecordList
                                                            .where((e) =>
                                                                e.timestamp ==
                                                                dateTimeFormat(
                                                                    'dd/MM/yyyy',
                                                                    functions.lastDate(profileOutputCollectionRecordList
                                                                        .map((e) =>
                                                                            e.timestamp)
                                                                        .toList())))
                                                            .toList()
                                                            .first
                                                            .response,
                                                        '0',
                                                      ))
                                                      .maybeHandleOverflow(
                                                        maxChars: 175,
                                                        replacement: '…',
                                                      ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Text(
                                                'Astrological Events',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color:
                                                              const Color(0xFFD9D9D9),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 12.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'calendarview',
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
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .borderfill,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(13.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            dateTimeFormat(
                                                                'MMMMd',
                                                                getCurrentTimestamp),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  color: const Color(
                                                                      0xFF7A7A7A),
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[0]} is in ${FFAppState().zodiacToday[0]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.physique.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[1]} is in ${FFAppState().zodiacToday[1]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.status.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[2]} is in ${FFAppState().zodiacToday[2]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.finances.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[3]} is in ${FFAppState().zodiacToday[3]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.relationship.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[4]} is in ${FFAppState().zodiacToday[4]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.career.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[5]} is in ${FFAppState().zodiacToday[5]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.travel.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[6]} is in ${FFAppState().zodiacToday[6]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.family.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${FFAppState().planetToday[7]} is in ${FFAppState().zodiacToday[7]}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .stats,
                                                                r'''$.response.bot_response.health.split_response''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
