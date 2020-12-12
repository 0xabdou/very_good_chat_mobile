part of 'navigation_cubit.dart';

/// Navigation state
@freezed
abstract class NavigationState with _$NavigationState {
  /// Constructor
  const factory NavigationState({
    @required AuthState authState,
    @Default(false) bool editingProfile,
    User viewingProfile,
    ViewingFullPhoto viewingProfilePicture,
  }) = _NavigationState;

  /// Initial state
  factory NavigationState.initial() {
    return const NavigationState(
      authState: AuthState.initial(),
    );
  }
}

/// Used by [NavigationState] when viewing a full screen photo
@freezed
abstract class ViewingFullPhoto with _$ViewingFullPhoto {
  /// Constructor
  const factory ViewingFullPhoto({
    @required String photoUrl,
    String heroTag,
  }) = _ViewingFullPhoto;
}
