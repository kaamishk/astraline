import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/calendar2_widget.dart';
import '/finalcomponents/nav_yoga/nav_yoga_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'calendarview_model.dart';
export 'calendarview_model.dart';

class CalendarviewWidget extends StatefulWidget {
  const CalendarviewWidget({super.key});

  @override
  State<CalendarviewWidget> createState() => _CalendarviewWidgetState();
}

class _CalendarviewWidgetState extends State<CalendarviewWidget> {
  late CalendarviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarviewModel());

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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 260.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).background,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Rectangle_9.png',
                          ).image,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(48.0),
                          bottomRight: Radius.circular(48.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        border: Border.all(
                          width: 0.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            17.0, 0.0, 17.0, 48.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            context.safePop();
                                          },
                                          child: Icon(
                                            Icons.arrow_back_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 28.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Transit Report ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
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
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 250),
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
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    'Hey, $currentUserDisplayName  👋',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Welcome to your Daily Transit\nReport!',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          constraints: const BoxConstraints(
                            minWidth: double.infinity,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).background,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<OutputCollectionRecord>>(
                                stream: queryOutputCollectionRecord(
                                  queryBuilder: (outputCollectionRecord) =>
                                      outputCollectionRecord.where(
                                    'ascendant',
                                    isEqualTo: valueOrDefault(
                                        currentUserDocument?.ascendantSign, ''),
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
                                          color: FlutterFlowTheme.of(context)
                                              .midyellow,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<OutputCollectionRecord>
                                      calendar2OutputCollectionRecordList =
                                      snapshot.data!;
                                  return wrapWithModel(
                                    model: _model.calendar2Model,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: Calendar2Widget(
                                      highlightedDateBackgoundColor:
                                          FlutterFlowTheme.of(context)
                                              .midyellow,
                                      highlightedDateTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      dateTextColor:
                                          FlutterFlowTheme.of(context)
                                              .lightcolor,
                                      width: 500.0,
                                      height: 500.0,
                                      dateBackgoundColor:
                                          FlutterFlowTheme.of(context)
                                              .background,
                                      headingTextColor:
                                          FlutterFlowTheme.of(context)
                                              .midyellow,
                                      headingFontSize: 32.0,
                                      nextMonthIcon: Icon(
                                        Icons.arrow_right,
                                        color: FlutterFlowTheme.of(context)
                                            .newcontainerfill,
                                        size: 32.0,
                                      ),
                                      prevMonthIcon: Icon(
                                        Icons.arrow_left,
                                        color: FlutterFlowTheme.of(context)
                                            .newcontainerfill,
                                        size: 32.0,
                                      ),
                                      highlightedDates:
                                          functions.dateListFormated(functions
                                              .stringToDateList(
                                                  calendar2OutputCollectionRecordList
                                                      .map((e) => e.timestamp)
                                                      .toList())
                                              .toList()),
                                      currentDate: getCurrentTimestamp,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: wrapWithModel(
                  model: _model.navYogaModel,
                  updateCallback: () => setState(() {}),
                  child: const NavYogaWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
