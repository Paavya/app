import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjTW6sxO11f70z0pPbMSj6Z9YrjyMwNoY",
            authDomain: "paavya-payments.firebaseapp.com",
            projectId: "paavya-payments",
            storageBucket: "paavya-payments.appspot.com",
            messagingSenderId: "581312900621",
            appId: "1:581312900621:web:1191db0f4a29c725b8ef44",
            measurementId: "G-FDZFV0P2GH"));
  } else {
    await Firebase.initializeApp();
  }
}
