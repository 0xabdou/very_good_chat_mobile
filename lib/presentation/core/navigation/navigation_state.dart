part of 'navigation_cubit.dart';

/// Navigation state
@freezed
abstract class NavigationState with _$NavigationState {
  /// Constructor
  const factory NavigationState({
    @required AuthState authState,
    bool editingProfile,
    User viewingProfile,
    bool viewingProfilePicture,
  }) = _NavigationState;

  /// Initial state
  factory NavigationState.initial() {
    return const NavigationState(
      authState: AuthState.initial(),
    );
  }
}
