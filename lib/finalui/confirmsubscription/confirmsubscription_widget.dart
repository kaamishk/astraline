import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'confirmsubscription_model.dart';
export 'confirmsubscription_model.dart';

class ConfirmsubscriptionWidget extends StatefulWidget {
  const ConfirmsubscriptionWidget({
    super.key,
    required this.doc,
    String? duration,
  }) : duration = duration ?? 'month';

  final SubscriptionPlansRecord? doc;
  final String duration;

  @override
  State<ConfirmsubscriptionWidget> createState() =>
      _ConfirmsubscriptionWidgetState();
}

class _ConfirmsubscriptionWidgetState extends State<ConfirmsubscriptionWidget> {
  late ConfirmsubscriptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmsubscriptionModel());

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
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 17.0, 0.0),
                  child: Row(
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
                              'Confirm Subscription',
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
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 84.0, 0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 4.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).black,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                17.0, 16.0, 17.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/logo_mark_(1).png',
                                    width: 55.0,
                                    height: 55.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.doc?.planName,
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    '\$${valueOrDefault<String>(
                                      formatNumber(
                                        widget.doc?.planPrice,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      '0',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color:
                                              FlutterFlowTheme.of(context).blue,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    '/${widget.duration}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final list =
                                            widget.doc?.includes.toList() ??
                                                [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: list.length,
                                          itemBuilder: (context, listIndex) {
                                            final listItem = list[listIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/tick.png',
                                                    width: 28.0,
                                                    height: 28.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    listItem,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final paymentResponse =
                                            await processStripePayment(
                                          context,
                                          amount: valueOrDefault<int>(
                                            widget.doc?.planPrice.round(),
                                            0,
                                          ),
                                          currency: 'USD',
                                          customerEmail: currentUserEmail,
                                          customerName: currentUserDisplayName,
                                          description:
                                              '${valueOrDefault<String>(
                                            widget.doc?.planName,
                                            '0',
                                          )} subscription payment',
                                          allowGooglePay: true,
                                          allowApplePay: false,
                                        );
                                        if (paymentResponse.paymentId == null &&
                                            paymentResponse.errorMessage !=
                                                null) {
                                          showSnackbar(
                                            context,
                                            'Error: ${paymentResponse.errorMessage}',
                                          );
                                        }
                                        _model.paymentId =
                                            paymentResponse.paymentId ?? '';

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          selectedPlan: widget.doc?.reference,
                                          subscriptionStart:
                                              getCurrentTimestamp,
                                          subscriptionEnd:
                                              widget.duration == 'Monthly'
                                                  ? functions.endDate(
                                                      getCurrentTimestamp, 30)
                                                  : functions.endDate(
                                                      getCurrentTimestamp, 365),
                                        ));

                                        context.pushNamed(
                                          'home',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 250),
                                            ),
                                          },
                                        );

                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.sPush,
                                            false)) {
                                          _model.apiResultgm6 =
                                              await CustomPushNotificationCall
                                                  .call(
                                            userId: currentUserUid,
                                            title: 'Astraline Subscription',
                                            body: 'Thank you for subscribing!',
                                            initialPageName: 'home',
                                          );
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.sEmail,
                                              false)) {
                                            _model.apiResults40 =
                                                await CustomEmailsCall.call(
                                              subject: 'Astraline Subscription',
                                              text:
                                                  'Thank you for subscribing!',
                                              toEmail: currentUserEmail,
                                            );
                                          }
                                        }

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
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Pay Now',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .black,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.arrow_forward_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black,
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
