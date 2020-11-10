import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(disallowNullValue: true, required: true) @required String id,
    @JsonKey(disallowNullValue: true, required: true) @required String username,
    @JsonKey(includeIfNull: false) String name,
    @JsonKey(includeIfNull: false) String photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
