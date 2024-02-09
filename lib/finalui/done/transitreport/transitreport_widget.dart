import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/finalcomponents/nav_home/nav_home_widget.dart';
import '/finalcomponents/subcribe/subcribe_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'transitreport_model.dart';
export 'transitreport_model.dart';

class TransitreportWidget extends StatefulWidget {
  const TransitreportWidget({super.key});

  @override
  State<TransitreportWidget> createState() => _TransitreportWidgetState();
}

class _TransitreportWidgetState extends State<TransitreportWidget> {
  late TransitreportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransitreportModel());

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

    return AuthUserStreamWidget(
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
          List<OutputCollectionRecord> transitreportOutputCollectionRecordList =
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(17.0, 12.0, 17.0, 0.0),
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
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 28.0,
                            ),
                          ),
                          InkWell(
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(17.0, 12.0, 17.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GradientText(
                            'Transit Report',
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
                              if ((currentUserDocument?.selectedPlan != null) &&
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
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
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                17.0, 12.0, 17.0, 12.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          transitreportOutputCollectionRecordList
                                              .where((e) =>
                                                  e.timestamp ==
                                                  dateTimeFormat(
                                                      'dd/MM/yyyy',
                                                      functions.lastDate(
                                                          transitreportOutputCollectionRecordList
                                                              .map((e) =>
                                                                  e.timestamp)
                                                              .toList())))
                                              .toList()
                                              .first
                                              .response,
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
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
        },
      ),
    );
  }
}
