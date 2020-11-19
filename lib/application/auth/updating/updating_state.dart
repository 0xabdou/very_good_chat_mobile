part of 'updating_cubit.dart';

@freezed
abstract class UpdatingState with _$UpdatingState {
  const factory UpdatingState({
    @required String authProviderAccessToken,
    @required String username,
    @required String name,
    @required bool callingApi,
    @required bool done,
    Uint8List photoBytes,
    String photoUrl,
    AuthFailure apiFailure,
    String usernameError,
  }) = _UpdatingState;

  factory UpdatingState.initial() => const UpdatingState(
        authProviderAccessToken: '',
        username: '',
        name: '',
        callingApi: false,
        done: false,
      );
}
