import 'package:firebase_core/firebase_core.dart';

/// This placeholder is replaced by `flutterfire configure`.
/// Keep Firebase disabled locally until a real project is selected.
abstract final class DefaultFirebaseOptions {
  static const isConfigured = false;

  static FirebaseOptions get currentPlatform {
    throw UnsupportedError(
      'Firebase is not configured. Run flutterfire configure first.',
    );
  }
}
