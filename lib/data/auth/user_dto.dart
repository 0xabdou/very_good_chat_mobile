import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/shared/custom_json_annotations.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDtoToSend with _$UserDtoToSend {
  const factory UserDtoToSend({
    @required String authProviderAccessToken,
    @required String username,
    String name,
    Uint8List photo,
  }) = _UserDtoToSend;
}

@freezed
abstract class UserDtoReceived with _$UserDtoReceived {
  const factory UserDtoReceived({
    @requiredNonNull @required String accessToken,
    @requiredNonNull @required String id,
    @requiredNonNull @required String username,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
  }) = _Received;
  factory UserDtoReceived.fromJson(Map<String, dynamic> json) =>
      _$UserDtoReceivedFromJson(json);
}
