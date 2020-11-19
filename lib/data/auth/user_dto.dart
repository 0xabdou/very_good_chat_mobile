import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
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
