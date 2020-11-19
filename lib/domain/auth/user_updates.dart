import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_updates.freezed.dart';

@freezed
abstract class UserUpdates with _$UserUpdates {
  const factory UserUpdates({
    @required String username,
    @required String name,
  }) = _UserUpdates;
}
