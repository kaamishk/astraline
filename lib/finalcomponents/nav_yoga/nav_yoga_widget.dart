import '/components/store_soon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'nav_yoga_model.dart';
export 'nav_yoga_model.dart';

class NavYogaWidget extends StatefulWidget {
  const NavYogaWidget({super.key});

  @override
  State<NavYogaWidget> createState() => _NavYogaWidgetState();
}

class _NavYogaWidgetState extends State<NavYogaWidget> {
  late NavYogaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavYogaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: 343.0,
      height: 83.0,
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 1.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.asset(
                  'assets/images/Union_(2).png',
                  width: 343.0,
                  height: 68.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Container(
                  width: 46.0,
                  height: 46.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/Union_(1).png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/LabelsYoga.png',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(50.0, 20.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'home',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 250),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 50.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'yoga',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 250),
                        ),
                      },
                    );
                  },
                  child: Container(
                    width: 50.0,
                    height: 83.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(50.0, 20.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: const Color(0x66000000),
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: const StoreSoonWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Container(
                    width: 50.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
