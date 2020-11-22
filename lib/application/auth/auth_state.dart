part of 'auth_cubit.dart';

/// The state class of the auth feature
@freezed
abstract class AuthState with _$AuthState {
  /// Initial state
  const factory AuthState.initial() = _Initial;
  /// Logged in state, contains the logged in [user]
  const factory AuthState.loggedIn(User user) = _LoggedIn;
  /// Registering state, contains the [authInfo] from the auth provided
  const factory AuthState.registering(AuthProviderInfo authInfo) = _Registering;
  /// Logged out state
  /// [loggingIn] true if the user is currently logging in
  /// if something went wrong during logging in, [failure] is set
  const factory AuthState.loggedOut({
    @Default(false) bool loggingIn,
    AuthFailure failure,
  }) = _LoggedOut;
}
