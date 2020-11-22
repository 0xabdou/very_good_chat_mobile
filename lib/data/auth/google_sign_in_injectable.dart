import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

/// Abstract class used by injectable to inject GoogleSignIn
@module
abstract class GoogleSignInInjectable {
  /// Returns a GoogleSignIn instance
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn(
        scopes: ['email', 'profile', 'openid'],
      );
}
