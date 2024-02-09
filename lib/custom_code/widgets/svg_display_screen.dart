// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart';

class SvgDisplayScreen extends StatefulWidget {
  final String svgContent;
  final double? width;
  final double? height;
  final Color? bgColor;

  SvgDisplayScreen(
      {Key? key,
      this.width,
      this.height,
      required this.svgContent,
      this.bgColor})
      : super(key: key);

  @override
  _SvgDisplayScreenState createState() => _SvgDisplayScreenState();
}

class _SvgDisplayScreenState extends State<SvgDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: Center(
        child: SvgPicture.string(
          widget.svgContent,
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
