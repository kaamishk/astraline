import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'subscriptionplans_model.dart';
export 'subscriptionplans_model.dart';

class SubscriptionplansWidget extends StatefulWidget {
  const SubscriptionplansWidget({super.key});

  @override
  State<SubscriptionplansWidget> createState() =>
      _SubscriptionplansWidgetState();
}

class _SubscriptionplansWidgetState extends State<SubscriptionplansWidget> {
  late SubscriptionplansModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionplansModel());

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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(17.0, 12.0, 17.0, 12.0),
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
                        context.safePop();
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
                            'Subscription Options',
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/full_logo_png.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          'Try Premium Now',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Libre Franklin',
                                color: FlutterFlowTheme.of(context).midyellow,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 45.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.duration = 'Monthly';
                                      });
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 47.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.duration == 'Monthly'
                                                ? FlutterFlowTheme.of(context)
                                                    .midyellow
                                                : FlutterFlowTheme.of(context)
                                                    .black,
                                            FlutterFlowTheme.of(context)
                                                .midyellow,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.duration == 'Monthly'
                                                  ? FlutterFlowTheme.of(context)
                                                      .black
                                                  : FlutterFlowTheme.of(context)
                                                      .midyellow,
                                              FlutterFlowTheme.of(context)
                                                  .black,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Monthly Billing',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Karla',
                                                color: valueOrDefault<Color>(
                                                  _model.duration == 'Monthly'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .black
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .midyellow,
                                                  FlutterFlowTheme.of(context)
                                                      .black,
                                                ),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.duration = 'Yearly';
                                      });
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 47.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          _model.duration != 'Yearly'
                                              ? FlutterFlowTheme.of(context)
                                                  .black
                                              : FlutterFlowTheme.of(context)
                                                  .midyellow,
                                          FlutterFlowTheme.of(context).black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            _model.duration != 'Yearly'
                                                ? FlutterFlowTheme.of(context)
                                                    .midyellow
                                                : FlutterFlowTheme.of(context)
                                                    .black,
                                            FlutterFlowTheme.of(context)
                                                .midyellow,
                                          ),
                                          width: 2.0,
                                        ),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Yearly Billing',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: valueOrDefault<Color>(
                                                    _model.duration != 'Yearly'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .midyellow
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .black,
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            'Save 33%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: valueOrDefault<Color>(
                                                    _model.duration != 'Yearly'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .midyellow
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .black,
                                                    FlutterFlowTheme.of(context)
                                                        .midyellow,
                                                  ),
                                                  fontSize: 12.0,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: StreamBuilder<List<SubscriptionPlansRecord>>(
                            stream: querySubscriptionPlansRecord(
                              queryBuilder: (subscriptionPlansRecord) =>
                                  subscriptionPlansRecord
                                      .where(
                                        'orderId',
                                        isNotEqualTo: 0,
                                      )
                                      .orderBy('orderId'),
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
                              List<SubscriptionPlansRecord>
                                  listViewSubscriptionPlansRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewSubscriptionPlansRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewSubscriptionPlansRecord =
                                      listViewSubscriptionPlansRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.selectedPlan =
                                              listViewSubscriptionPlansRecord;
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .txtfieldbg,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              listViewSubscriptionPlansRecord
                                                          .reference ==
                                                      _model.selectedPlan
                                                          ?.reference
                                                  ? FlutterFlowTheme.of(context)
                                                      .darkyellow
                                                  : FlutterFlowTheme.of(context)
                                                      .txtfieldbg,
                                              FlutterFlowTheme.of(context)
                                                  .txtfieldbg,
                                            ),
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 25.0, 12.0, 25.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 18.0,
                                                    height: 18.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .darkyellow,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(2.5),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: listViewSubscriptionPlansRecord
                                                                      .reference ==
                                                                  _model
                                                                      .selectedPlan
                                                                      ?.reference
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .darkyellow
                                                              : const Color(
                                                                  0x00000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            listViewSubscriptionPlansRecord
                                                                .planName,
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
                                                        Text(
                                                          '\$${_model.duration == 'Monthly' ? formatNumber(
                                                              listViewSubscriptionPlansRecord
                                                                  .planPrice,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                            ) : formatNumber(
                                                              listViewSubscriptionPlansRecord
                                                                      .planPrice *
                                                                  12,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                            )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .blue,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(33.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewSubscriptionPlansRecord
                                                          .planDescription,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                fontSize: 12.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      _model.duration ==
                                                              'Monthly'
                                                          ? '/ month'
                                                          : '/ year',
                                                      '/ month',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
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
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.selectedPlan != null) {
                          context.pushNamed(
                            'confirmsubscription',
                            queryParameters: {
                              'doc': serializeParam(
                                _model.selectedPlan,
                                ParamType.Document,
                              ),
                              'duration': serializeParam(
                                _model.duration,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'doc': _model.selectedPlan,
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 250),
                              ),
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please select any plan.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).darkyellow,
                                  fontSize: 16.0,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).txtfieldbg,
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 47.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                            Text(
                              'Confirm Subscription',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: FlutterFlowTheme.of(context).black,
                                size: 24.0,
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
    );
  }
}
