// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

Future<void> saveSvgToFirebaseStorage(String base64SvgScript) async {
  // Step 1: Decode the base64-encoded SVG script
  List<int> svgBytes = base64Decode(base64SvgScript);
  String svgContent = utf8.decode(svgBytes);

  // Step 2: Save the decoded SVG content to a file
  String fileName = "abc.svg"; // Set your desired file name
  File svgFile = File(fileName);
  await svgFile.writeAsString(svgContent);

  // Step 3: Upload the file to Firebase Storage
  String firebaseStoragePath =
      "https://console.firebase.google.com/u/0/project/astraline-c5463/storage/astraline-c5463.appspot.com/files/$fileName"; // Set your desired storage path
  Reference storageReference =
      FirebaseStorage.instance.ref().child(firebaseStoragePath);
  UploadTask uploadTask = storageReference.putFile(svgFile);

  // Wait for the upload to complete
  await uploadTask.whenComplete(() => print("Upload complete"));

  // Optionally, you can get the download URL
  String downloadURL = await storageReference.getDownloadURL();
  print("Download URL: $downloadURL");
}
