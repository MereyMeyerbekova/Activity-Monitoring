import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAnOWQByhDvgqMgjTDh-aHUO0uojo3-3Hg",
            authDomain: "translate-6a15d.firebaseapp.com",
            projectId: "translate-6a15d",
            storageBucket: "translate-6a15d.appspot.com",
            messagingSenderId: "1029556190478",
            appId: "1:1029556190478:web:c5f218eaf03cf4afef6b5f"));
  } else {
    await Firebase.initializeApp();
  }
}
