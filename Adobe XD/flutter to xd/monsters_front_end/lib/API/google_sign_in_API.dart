import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> signin() => _googleSignIn.signIn();

  static Future signout() => _googleSignIn.disconnect();
}
