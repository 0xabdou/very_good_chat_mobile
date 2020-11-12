part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loggedIn(User user) = _LoggedIn;
  const factory AuthState.registering() = _Registering;
  const factory AuthState.loggedOut() = _LoggedOut;
  const factory AuthState.error(AuthFailure failure) = _Error;
}
