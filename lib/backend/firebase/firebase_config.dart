import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCO6Q-jvzbznlSp3YxpzdTnMFzuAYTENts",
            authDomain: "pick-e652b.firebaseapp.com",
            projectId: "pick-e652b",
            storageBucket: "pick-e652b.appspot.com",
            messagingSenderId: "753057629183",
            appId: "1:753057629183:web:e5319da688b3d693a99dca"));
  } else {
    await Firebase.initializeApp();
  }
}
