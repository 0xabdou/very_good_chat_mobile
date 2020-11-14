part of 'registration_cubit.dart';

@freezed
abstract class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @required String authProviderAccessToken,
    @required String username,
    @required String name,
    @required bool callingApi,
    @required bool done,
    Uint8List photoBytes,
    String photoUrl,
    AuthFailure apiFailure,
    String usernameError,
  }) = _RegistrationState;

  factory RegistrationState.initial() => const RegistrationState(
        authProviderAccessToken: '',
        username: '',
        name: '',
        callingApi: false,
        done: false,
      );
}
