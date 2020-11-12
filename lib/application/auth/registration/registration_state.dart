part of 'registration_cubit.dart';

@freezed
abstract class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @required String username,
    @required String name,
    @required bool callingApi,
    File photo,
    AuthFailure apiFailure,
    String usernameError,
  }) = _RegistrationState;

  factory RegistrationState.initial() => const RegistrationState(
        username: '',
        name: '',
        callingApi: false,
      );
}
