import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/utils/serialization_utils.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// A class that holds a data used to create a new user
@freezed
abstract class UserToCreate with _$UserToCreate {
  /// Constructor
  const factory UserToCreate({
    @required String authProviderAccessToken,
    @required String username,
    String name,
    Uint8List photo,
  }) = _UserToCreate;
}

/// A class that hold the data of a signed in user
@freezed
abstract class SignedInUser with _$SignedInUser {
  /// Constructor
  const factory SignedInUser({
    @requiredNotNull @required String accessToken,
    @requiredNotNull @required String id,
    @requiredNotNull @required String username,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
  }) = _SignedInUser;

  /// Serializes this object to json
  factory SignedInUser.fromJson(Map<String, dynamic> json) =>
      _$SignedInUserFromJson(json);
}

/// A class that holds the data used to update a user
@freezed
abstract class UserUpdates implements _$UserUpdates {
  const UserUpdates._();

  /// Constructor
  const factory UserUpdates({
    @doNotIncludeIfNull String username,
    @doNotIncludeIfNull String name,
  }) = _UserUpdates;

  /// Serializes this object to json
  factory UserUpdates.fromJson(Map<String, dynamic> json) =>
      _$UserUpdatesFromJson(json);

  /// True if username and name are null
  bool isEmpty() {
    return username == null && name == null;
  }

  /// Check for updates against a user object
  bool hasUpdates(User user) {
    return username != user.username || name != user.name;
  }
}
