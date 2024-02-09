import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/finalcomponents/contactreq/contactreq_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notifictions_model.dart';
export 'notifictions_model.dart';

class NotifictionsWidget extends StatefulWidget {
  const NotifictionsWidget({super.key});

  @override
  State<NotifictionsWidget> createState() => _NotifictionsWidgetState();
}

class _NotifictionsWidgetState extends State<NotifictionsWidget> {
  late NotifictionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotifictionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(17.0, 12.0, 17.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: InkWell(
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
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                    child: Text(
                      'Notifications',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Libre Franklin',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/notif_icon.png',
                                      width: 36.0,
                                      height: 36.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Allow notifications',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => Switch.adaptive(
                                  value: _model.allNotificationValue ??=
                                      valueOrDefault<bool>(
                                          currentUserDocument?.notificationAll,
                                          false),
                                  onChanged: (newValue) async {
                                    setState(() => _model.allNotificationValue =
                                        newValue);
                                    if (newValue) {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        notificationAll: true,
                                      ));
                                    } else {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        notificationAll: false,
                                        dtsEmail: false,
                                        dtsPush: false,
                                        sEmail: false,
                                        sPush: false,
                                        mEmail: false,
                                        cEmail: false,
                                      ));
                                      setState(() {
                                        _model.dtsEmailValue = false;
                                      });
                                      setState(() {
                                        _model.dtsPushValue = false;
                                      });
                                      setState(() {
                                        _model.sEmailValue = false;
                                      });
                                      setState(() {
                                        _model.sPushValue = false;
                                      });
                                      setState(() {
                                        _model.mEmailValue = false;
                                      });
                                      setState(() {
                                        _model.cEmailValue = false;
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).darkyellow,
                                  activeTrackColor: const Color(0x33F6A400),
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).txtfieldbg,
                                  inactiveThumbColor: const Color(0x33F6A400),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: Text(
                                'Daily Transit Report',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Text(
                                'Notifications about our daily transit report.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 10.0,
                                    ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.2,
                            color: FlutterFlowTheme.of(context).lighticon,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/email_icon.png',
                                        width: 36.0,
                                        height: 36.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Email Address',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Switch.adaptive(
                                        value: _model.dtsEmailValue ??=
                                            valueOrDefault<bool>(
                                                currentUserDocument?.dtsEmail,
                                                false),
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.dtsEmailValue = newValue);
                                          if (newValue) {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.notificationAll,
                                                false)) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                dtsEmail: true,
                                              ));
                                            }
                                          } else {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              dtsEmail: false,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        activeTrackColor: const Color(0x33F6A400),
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .txtfieldbg,
                                        inactiveThumbColor: const Color(0x33F6A400),
                                      ),
                                    ),
                                    if (!valueOrDefault<bool>(
                                        currentUserDocument?.notificationAll,
                                        false))
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 50.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/push_icon.png',
                                        width: 36.0,
                                        height: 36.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Push',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Switch.adaptive(
                                        value: _model.dtsPushValue ??=
                                            valueOrDefault<bool>(
                                                currentUserDocument?.dtsPush,
                                                false),
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.dtsPushValue = newValue);
                                          if (newValue) {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.notificationAll,
                                                false)) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                dtsPush: true,
                                              ));
                                            }
                                          } else {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              dtsPush: false,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        activeTrackColor: const Color(0x33F6A400),
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .txtfieldbg,
                                        inactiveThumbColor: const Color(0x33F6A400),
                                      ),
                                    ),
                                    if (!valueOrDefault<bool>(
                                        currentUserDocument?.notificationAll,
                                        false))
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 50.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: Text(
                                'Subscriptions',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Text(
                                'Notifications about new updates on your subscriptions.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 10.0,
                                    ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.2,
                            color: FlutterFlowTheme.of(context).lighticon,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/email_icon.png',
                                        width: 36.0,
                                        height: 36.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Email Address',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Switch.adaptive(
                                        value: _model.sEmailValue ??=
                                            valueOrDefault<bool>(
                                                currentUserDocument?.sEmail,
                                                false),
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.sEmailValue = newValue);
                                          if (newValue) {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.notificationAll,
                                                false)) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                sEmail: true,
                                              ));
                                            }
                                          } else {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              sEmail: false,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        activeTrackColor: const Color(0x33F6A400),
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .txtfieldbg,
                                        inactiveThumbColor: const Color(0x33F6A400),
                                      ),
                                    ),
                                    if (!valueOrDefault<bool>(
                                        currentUserDocument?.notificationAll,
                                        false))
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 50.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/push_icon.png',
                                        width: 36.0,
                                        height: 36.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Push',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Switch.adaptive(
                                        value: _model.sPushValue ??=
                                            valueOrDefault<bool>(
                                                currentUserDocument?.sPush,
                                                false),
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.sPushValue = newValue);
                                          if (newValue) {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.notificationAll,
                                                false)) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                sPush: true,
                                              ));
                                            }
                                          } else {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              sPush: false,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        activeTrackColor: const Color(0x33F6A400),
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .txtfieldbg,
                                        inactiveThumbColor: const Color(0x33F6A400),
                                      ),
                                    ),
                                    if (!valueOrDefault<bool>(
                                        currentUserDocument?.notificationAll,
                                        false))
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 50.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: Text(
                                'Marketplace',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Text(
                                'Update on your purchases and most popular items in the marketplace',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 10.0,
                                    ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.2,
                            color: FlutterFlowTheme.of(context).lighticon,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/email_icon.png',
                                        width: 36.0,
                                        height: 36.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Email Address',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Switch.adaptive(
                                        value: _model.mEmailValue ??=
                                            valueOrDefault<bool>(
                                                currentUserDocument?.mEmail,
                                                false),
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.mEmailValue = newValue);
                                          if (newValue) {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.notificationAll,
                                                false)) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                mEmail: true,
                                              ));
                                            }
                                          } else {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              mEmail: false,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        activeTrackColor: const Color(0x33F6A400),
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .txtfieldbg,
                                        inactiveThumbColor: const Color(0x33F6A400),
                                      ),
                                    ),
                                    if (!valueOrDefault<bool>(
                                        currentUserDocument?.notificationAll,
                                        false))
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 50.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: Text(
                                'Our Campaigns',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Text(
                                'Update about causes we care about.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontSize: 10.0,
                                    ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.2,
                            color: FlutterFlowTheme.of(context).lighticon,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/email_icon.png',
                                        width: 36.0,
                                        height: 36.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Email Address',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Switch.adaptive(
                                        value: _model.cEmailValue ??=
                                            valueOrDefault<bool>(
                                                currentUserDocument?.cEmail,
                                                false),
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.cEmailValue = newValue);
                                          if (newValue) {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.notificationAll,
                                                false)) {
                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                cEmail: true,
                                              ));
                                            }
                                          } else {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              cEmail: false,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .darkyellow,
                                        activeTrackColor: const Color(0x33F6A400),
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .txtfieldbg,
                                        inactiveThumbColor: const Color(0x33F6A400),
                                      ),
                                    ),
                                    if (!valueOrDefault<bool>(
                                        currentUserDocument?.notificationAll,
                                        false))
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 50.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(),
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
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 20.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          enableDrag: false,
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
                                  child: const ContactreqWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).midyellow,
                            ),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Contact Us ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color:
                                        FlutterFlowTheme.of(context).midyellow,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
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
