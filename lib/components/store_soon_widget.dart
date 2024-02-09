import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'store_soon_model.dart';
export 'store_soon_model.dart';

class StoreSoonWidget extends StatefulWidget {
  const StoreSoonWidget({super.key});

  @override
  State<StoreSoonWidget> createState() => _StoreSoonWidgetState();
}

class _StoreSoonWidgetState extends State<StoreSoonWidget> {
  late StoreSoonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreSoonModel());

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(58.0, 0.0, 58.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 245.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).iconbutton,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 35.0,
                    fillColor: const Color(0x004B39EF),
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).iconbutton,
                      size: 18.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/logo_mark_(1).png',
                    width: 62.0,
                    height: 62.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 21.0, 0.0, 0.0),
                  child: GradientText(
                    'Astraline Store',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                    colors: [
                      FlutterFlowTheme.of(context).lightyellow,
                      FlutterFlowTheme.of(context).midyellow,
                      FlutterFlowTheme.of(context).darkyellow
                    ],
                    gradientDirection: GradientDirection.ttb,
                    gradientType: GradientType.linear,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Coming Soon',
                    style: FlutterFlowTheme.of(context).bodyMedium,
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
