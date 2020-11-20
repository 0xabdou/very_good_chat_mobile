part of 'updating_cubit.dart';

@freezed
abstract class UpdatingState with _$UpdatingState {
  const factory UpdatingState({
    @required String username,
    @required String name,
    @Default(false) bool callingApi,
    @Default(false) bool done,
    @Default(false) bool registering,
    @Default(false) bool uploadingPhoto,
    String authProviderAccessToken,
    Uint8List photoBytes,
    String photoUrl,
    AuthFailure apiFailure,
    String usernameError,
  }) = _UpdatingState;

  factory UpdatingState.initial() => const UpdatingState(
        username: '',
        name: '',
      );
}
