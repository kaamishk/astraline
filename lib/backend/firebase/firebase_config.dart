import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBItvN0_WMMoBg_e7TSN75FZ8Tl2N0vSQM",
            authDomain: "astraline-c5463.firebaseapp.com",
            projectId: "astraline-c5463",
            storageBucket: "astraline-c5463.appspot.com",
            messagingSenderId: "587888056010",
            appId: "1:587888056010:web:ff214b2d2580eaf308c633",
            measurementId: "G-7NN6Q4TXSR"));
  } else {
    await Firebase.initializeApp();
  }
}
