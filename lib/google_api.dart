import 'package:flutter/foundation.dart';

import 'google_api_mobile.dart' if (dart.library.html) 'google_api_web.dart';

class GoogleApi {
  static Future<void> signIn() => GoogleApiImplementation.signIn();
  static String? get displayName => GoogleApiImplementation.displayName;
  static String? get email => GoogleApiImplementation.email;
  static Future<void> signOut() => GoogleApiImplementation.signOut();
}
