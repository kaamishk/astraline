import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'calendar2_model.dart';
export 'calendar2_model.dart';

class Calendar2Widget extends StatefulWidget {
  const Calendar2Widget({
    super.key,
    required this.highlightedDates,
    required this.currentDate,
    Color? highlightedDateBackgoundColor,
    Color? highlightedDateTextColor,
    Color? dateTextColor,
    double? width,
    double? height,
    Color? dateBackgoundColor,
    Color? headingTextColor,
    double? headingFontSize,
    required this.nextMonthIcon,
    required this.prevMonthIcon,
  })  : highlightedDateBackgoundColor =
            highlightedDateBackgoundColor ?? const Color(0xFF7F4ED9),
        highlightedDateTextColor =
            highlightedDateTextColor ?? Colors.white,
        dateTextColor = dateTextColor ?? Colors.black,
        width = width ?? 500.0,
        height = height ?? 500.0,
        dateBackgoundColor = dateBackgoundColor ?? Colors.white,
        headingTextColor = headingTextColor ?? Colors.black,
        headingFontSize = headingFontSize ?? 18.0;

  final List<DateTime>? highlightedDates;
  final DateTime? currentDate;
  final Color highlightedDateBackgoundColor;
  final Color highlightedDateTextColor;
  final Color dateTextColor;
  final double width;
  final double height;
  final Color dateBackgoundColor;
  final Color headingTextColor;
  final double headingFontSize;
  final Widget? nextMonthIcon;
  final Widget? prevMonthIcon;

  @override
  State<Calendar2Widget> createState() => _Calendar2WidgetState();
}

class _Calendar2WidgetState extends State<Calendar2Widget> {
  late Calendar2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Calendar2Model());

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

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).background,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: GradientText(
                      dateTimeFormat(
                          'MMMM', functions.getNextMonth(_model.monthsToSkip)),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Libre Franklin',
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600,
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
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.monthsToSkip = _model.monthsToSkip + -1;
                        });
                      },
                      child: widget.prevMonthIcon!,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.monthsToSkip = _model.monthsToSkip + 1;
                        });
                      },
                      child: widget.nextMonthIcon!,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.8,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Text(
                          'Mon',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          'Tue',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Wed',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Thu',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Fri',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Sat',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'Sun',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).newcontainerfill,
            ),
            Container(
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
              ),
              child: Builder(
                builder: (context) {
                  final dates = functions
                      .getDateTimeOfThisMonth(
                          widget.currentDate!, _model.monthsToSkip)
                      .toList();
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: dates.length,
                    itemBuilder: (context, datesIndex) {
                      final datesItem = dates[datesIndex];
                      return Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).background,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.highlightedDates!.contains(datesItem)) {
                              context.pushNamed(
                                'transitreport2',
                                queryParameters: {
                                  'selDate': serializeParam(
                                    dateTimeFormat('dd/MM/yyyy', datesItem),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  dateTimeFormat('d', datesItem),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color: valueOrDefault<Color>(
                                          dateTimeFormat(
                                                      'MMMM',
                                                      functions.getNextMonth(
                                                          _model
                                                              .monthsToSkip)) ==
                                                  dateTimeFormat(
                                                      'MMMM', datesItem)
                                              ? (widget.highlightedDates!
                                                      .contains(datesItem)
                                                  ? widget
                                                      .highlightedDateTextColor
                                                  : widget.dateTextColor)
                                              : FlutterFlowTheme.of(context)
                                                  .background,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 5.0, 0.0),
                                  child: Container(
                                    width: 9.0,
                                    height: 9.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        dateTimeFormat(
                                                    'MMMM',
                                                    functions.getNextMonth(
                                                        _model.monthsToSkip)) ==
                                                dateTimeFormat(
                                                    'MMMM', datesItem)
                                            ? (widget.highlightedDates!
                                                    .contains(datesItem)
                                                ? widget
                                                    .highlightedDateBackgoundColor
                                                : widget.dateBackgoundColor)
                                            : FlutterFlowTheme.of(context)
                                                .background,
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
