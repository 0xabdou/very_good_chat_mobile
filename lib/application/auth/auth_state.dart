part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loggedIn(User user) = _LoggedIn;
  const factory AuthState.registering(AuthProviderInfo authInfo) = _Registering;
  const factory AuthState.loggedOut({
    @Default(false) bool loggingIn,
    AuthFailure failure,
  }) = _LoggedOut;
}
