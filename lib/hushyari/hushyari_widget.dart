import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'hushyari_model.dart';
export 'hushyari_model.dart';

class HushyariWidget extends StatefulWidget {
  const HushyariWidget({super.key});

  @override
  State<HushyariWidget> createState() => _HushyariWidgetState();
}

class _HushyariWidgetState extends State<HushyariWidget> {
  late HushyariModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HushyariModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 500.0,
                height: 500.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).black,
                ),
                child: Html(
                  data:
                      '<?xml version="1.0" encoding="iso-8859-1"?>\n   <!-- Generator: Adobe Illustrator 16.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->\n   <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\n   <svg height="500" width="500" xmlns="http://www.w3.org/2000/svg">\n        <line x1="0" y1="0" x2="500" y2="500" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n        <line x1="500" y1="0" x2="0" y2="500" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n        \n        <line x1="1.5" y1="0" x2="1.5" y2="500" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n        <line x1="0" y1="498" x2="500" y2="498" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n        <line x1="498" y1="500" x2="498" y2="0" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n    \n            <line x1="0" y1="1.5" x2="500" y2="1.5" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n            <line x1="250" y1="0" x2="0" y2="250" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n            <line x1="250" y1="0" x2="500" y2="250" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n            <line x1="250" y1="500" x2="500" y2="250" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n            <line x1="250" y1="500" x2="0" y2="250" style="stroke:rgb(0, 0, 0);stroke-width:3" />\n            <text x="177.5" y= "130" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;font-size: 12.6px;align-items: center;fill:#1F222E;font-weight:bold ">As</text><text x="240" y= "130" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;font-size: 12.6px;align-items: center;fill:#1F222E;font-weight:bold ">Ju</text><text x="302.5" y= "130" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;font-size: 12.6px;align-items: center;fill:#1F222E;font-weight:bold ">Ke</text><text x="240" y= "380" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;font-size: 12.6px;align-items: center;fill:#1F222E;font-weight:bold ">Ra</text><text x="365" y= "452.3863636363636" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;align-items: center;fill:#1F222E;font-size: 12.6px;font-weight:bold ">Mo</text><text x="323.3333333333333" y= "255" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;font-size: 12.6px;align-items: center;fill:#1F222E;font-weight:bold ">Ma</text><text x="406.66666666666663" y= "255" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;font-size: 12.6px;align-items: center;fill:#1F222E;font-weight:bold ">Ve</text><text x="310" y= "51.81818181818181" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;align-items: center;fill:#1F222E;font-size: 12.6px;font-weight:bold ">Su</text><text x="365" y= "51.81818181818181" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;align-items: center;fill:#1F222E;font-size: 12.6px;font-weight:bold ">Me</text><text x="420" y= "51.81818181818181" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;display: flex;justify-content: center;align-items: center;fill:#1F222E;font-size: 12.6px;font-weight:bold ">Sa</text>\n\n            <text x="250" y= "230" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:middle;fill:#919191;font-size: 12.6px; ">8 </text>\n            <text x="125" y= "110" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:middle;fill:#919191;font-size: 12.6px; ">9 </text>\n        <text x="105" y= "130" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:end;fill:#919191;font-size: 12.6px;">10 </text>\n        \n        <text x="230" y= "255" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:end;fill:#919191;font-size: 12.6px; ">11 </text>\n        <text x="105" y= "380" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:end;fill:#919191;font-size: 12.6px; ">12 </text>\n        <text x="125" y= "405" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:middle;fill:#919191;letter-spacing: -1px;font-size: 12.6px; ">1 </text>\n        \n        <text x="250" y= "290" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:middle;fill:#919191 ;letter-spacing: -1px;font-size: 12.6px;">2 </text>\n        <text x="370" y= "405" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:middle;fill:#919191;letter-spacing: -1px;font-size: 12.6px;">3 </text>\n        <text x="385" y= "380" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:start;fill:#919191;letter-spacing: -1px;font-size: 12.6px; ">4 </text>\n        \n        <text x="265" y= "255" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:start;fill:#919191;letter-spacing: -1px;font-size: 12.6px; ">5 </text>\n        <text x="390" y= "130" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:start;fill:#919191;font-size: 12.6px; ">6 </text>\n        <text x="370" y= "110" style = "font-family: \'\',\'Lucida Sans\', \'Lucida Sans Regular\', \'Lucida Grande\', \'Lucida Sans Unicode\', Geneva, Verdana, sans-serif;text-anchor:middle;fill:#919191;font-size: 12.6px; ">7 </text>\n        \n        </svg>\n         \n    \n   \n  ',
                  onLinkTap: (url, _, __, ___) => launchURL(url!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
