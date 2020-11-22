import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/shared/custom_json_annotations.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// A class that holds user data
@freezed
abstract class User with _$User {
  /// Constructor
  const factory User({
    @requiredNonNull @required String id,
    @requiredNonNull @required String username,
    @doNotIncludeIfNull String name,
    @doNotIncludeIfNull String photoUrl,
  }) = _User;

  /// Serializes this object to json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
