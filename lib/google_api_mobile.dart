import 'package:google_sign_in/google_sign_in.dart';

class GoogleApiImplementation {
  static final _googleSignIn = GoogleSignIn();

  static Future<void> signIn() async {
    await _googleSignIn.signIn();
  }

  static String? get displayName => _googleSignIn.currentUser?.displayName;
  static String? get email => _googleSignIn.currentUser?.email;

  static Future<void> signOut() => _googleSignIn.signOut();
}
