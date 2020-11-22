import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_failure.freezed.dart';

/// A sealed class of failures that can happen during friend operations
@freezed
abstract class FriendFailure with _$FriendFailure {
  /// Server failure
  const factory FriendFailure.server() = _Server;

  /// Network failure
  const factory FriendFailure.network() = _Network;

  /// Local failure
  const factory FriendFailure.local() = _Local;
}
