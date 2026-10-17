import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

abstract final class FirebaseBootstrap {
  static bool isConfigured = false;

  static Future<void> initialize() async {
    if (!DefaultFirebaseOptions.isConfigured) return;

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    isConfigured = true;
  }
}
