part of 'profile_cubit.dart';

/// State class of profile cubit
@freezed
abstract class ProfileState with _$ProfileState {
  /// Constructor
  /// [user] is the user whom the profile is being viewed
  /// [relationship] is the relationship between the
  const factory ProfileState({
    @required bool initialized,
    User user,
    Relationship relationship,
  }) = _ProfileState;
}
