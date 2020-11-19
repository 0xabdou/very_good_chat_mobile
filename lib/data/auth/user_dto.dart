import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/custom_json_annotations.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserToCreate with _$UserToCreate {
  const factory UserToCreate({
    @required String authProviderAccessToken,
    @required String username,
    String name,
    Uint8List photo,
  }) = _UserToCreate;
}

@freezed
abstract class UserCreated with _$UserCreated {
  const factory UserCreated({
    @requiredNonNull @required String accessToken,
    @requiredNonNull @required String id,
    @requiredNonNull @required String username,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
  }) = _UserCreated;
  factory UserCreated.fromJson(Map<String, dynamic> json) =>
      _$UserCreatedFromJson(json);
}

@freezed
abstract class UserUpdates implements _$UserUpdates {
  const UserUpdates._();

  const factory UserUpdates({
    @doNotIncludeIfNull String username,
    @doNotIncludeIfNull String name,
  }) = _UserUpdates;

  factory UserUpdates.fromJson(Map<String, dynamic> json) =>
      _$UserUpdatesFromJson(json);

  bool isEmpty() {
    return username == null && name == null;
  }

  bool hasUpdates(User user) {
    return username != user.username || name != user.name;
  }
}
