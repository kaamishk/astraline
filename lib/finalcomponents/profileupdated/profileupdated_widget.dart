import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'profileupdated_model.dart';
export 'profileupdated_model.dart';

class ProfileupdatedWidget extends StatefulWidget {
  const ProfileupdatedWidget({super.key});

  @override
  State<ProfileupdatedWidget> createState() => _ProfileupdatedWidgetState();
}

class _ProfileupdatedWidgetState extends State<ProfileupdatedWidget> {
  late ProfileupdatedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileupdatedModel());

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
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 180.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 6.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).lighticon,
                    borderRadius: 20.0,
                    borderWidth: 2.0,
                    buttonSize: 35.0,
                    fillColor: const Color(0x004B39EF),
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).lighticon,
                      size: 18.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/logo_mark_(1).png',
                  width: 62.0,
                  height: 62.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: GradientText(
                  'Hooray!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
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
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Your Profile Update is complete!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
