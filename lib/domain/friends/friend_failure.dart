import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_failure.freezed.dart';

@freezed
abstract class FriendFailure with _$FriendFailure {
  const factory FriendFailure.server() = _Server;
  const factory FriendFailure.network() = _Network;
  const factory FriendFailure.local() = _Local;
}
