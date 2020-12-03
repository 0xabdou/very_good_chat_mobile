import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'relationship.freezed.dart';

/// A sealed class representing the different relationships
/// between the current user and some other user
@freezed
abstract class Relationship with _$Relationship {
  /// The user is the current signed in user
  const factory Relationship.self() = _Self;

  /// The user is one of the current user's friends
  const factory Relationship.friend({
    @required bool isOnline,
    DateTime lastSeen,
  }) = _Friend;

  /// The current user has sent a friend request to the user
  const factory Relationship.requestSent() = _ReqSent;

  /// The user has sent a friend request to the current
  const factory Relationship.requestReceived() = _ReqReceived;

  /// The user is blocked by the current user
  const factory Relationship.blocked() = _Blocked;

  /// The user has no relation to the current user
  const factory Relationship.stranger() = _Stranger;
}
