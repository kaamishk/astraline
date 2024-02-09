import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'geo_details_model.dart';
export 'geo_details_model.dart';

class GeoDetailsWidget extends StatefulWidget {
  const GeoDetailsWidget({
    super.key,
    required this.cityName,
  });

  final List<dynamic>? cityName;

  @override
  State<GeoDetailsWidget> createState() => _GeoDetailsWidgetState();
}

class _GeoDetailsWidgetState extends State<GeoDetailsWidget> {
  late GeoDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeoDetailsModel());

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
        padding: const EdgeInsetsDirectional.fromSTEB(44.0, 0.0, 44.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: Builder(
              builder: (context) {
                final list = widget.cityName!.toList();
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(list.length, (listIndex) {
                      final listItem = list[listIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            FFAppState().geoDetails = listItem;
                          });
                          Navigator.pop(
                              context,
                              '${getJsonField(
                                listItem,
                                r'''$.place_name''',
                              ).toString()},${getJsonField(
                                listItem,
                                r'''$.country_code''',
                              ).toString()}');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                '${getJsonField(
                                  listItem,
                                  r'''$.place_name''',
                                ).toString()},${getJsonField(
                                  listItem,
                                  r'''$.country_code''',
                                ).toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
