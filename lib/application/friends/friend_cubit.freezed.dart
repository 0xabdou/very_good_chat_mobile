// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'friend_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FriendStateTearOff {
  const _$FriendStateTearOff();

// ignore: unused_element
  _FriendState call(
      {@required List<Friend> allFriends,
      @required List<Friend> onlineFriends,
      @required List<Friend> offlineFriends,
      @required List<FriendRequest> friendRequests,
      FriendFailure failure}) {
    return _FriendState(
      allFriends: allFriends,
      onlineFriends: onlineFriends,
      offlineFriends: offlineFriends,
      friendRequests: friendRequests,
      failure: failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FriendState = _$FriendStateTearOff();

/// @nodoc
mixin _$FriendState {
  List<Friend> get allFriends;
  List<Friend> get onlineFriends;
  List<Friend> get offlineFriends;
  List<FriendRequest> get friendRequests;
  FriendFailure get failure;

  $FriendStateCopyWith<FriendState> get copyWith;
}

/// @nodoc
abstract class $FriendStateCopyWith<$Res> {
  factory $FriendStateCopyWith(
          FriendState value, $Res Function(FriendState) then) =
      _$FriendStateCopyWithImpl<$Res>;
  $Res call(
      {List<Friend> allFriends,
      List<Friend> onlineFriends,
      List<Friend> offlineFriends,
      List<FriendRequest> friendRequests,
      FriendFailure failure});

  $FriendFailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$FriendStateCopyWithImpl<$Res> implements $FriendStateCopyWith<$Res> {
  _$FriendStateCopyWithImpl(this._value, this._then);

  final FriendState _value;
  // ignore: unused_field
  final $Res Function(FriendState) _then;

  @override
  $Res call({
    Object allFriends = freezed,
    Object onlineFriends = freezed,
    Object offlineFriends = freezed,
    Object friendRequests = freezed,
    Object failure = freezed,
  }) {
    return _then(_value.copyWith(
      allFriends: allFriends == freezed
          ? _value.allFriends
          : allFriends as List<Friend>,
      onlineFriends: onlineFriends == freezed
          ? _value.onlineFriends
          : onlineFriends as List<Friend>,
      offlineFriends: offlineFriends == freezed
          ? _value.offlineFriends
          : offlineFriends as List<Friend>,
      friendRequests: friendRequests == freezed
          ? _value.friendRequests
          : friendRequests as List<FriendRequest>,
      failure: failure == freezed ? _value.failure : failure as FriendFailure,
    ));
  }

  @override
  $FriendFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $FriendFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
abstract class _$FriendStateCopyWith<$Res>
    implements $FriendStateCopyWith<$Res> {
  factory _$FriendStateCopyWith(
          _FriendState value, $Res Function(_FriendState) then) =
      __$FriendStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Friend> allFriends,
      List<Friend> onlineFriends,
      List<Friend> offlineFriends,
      List<FriendRequest> friendRequests,
      FriendFailure failure});

  @override
  $FriendFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$FriendStateCopyWithImpl<$Res> extends _$FriendStateCopyWithImpl<$Res>
    implements _$FriendStateCopyWith<$Res> {
  __$FriendStateCopyWithImpl(
      _FriendState _value, $Res Function(_FriendState) _then)
      : super(_value, (v) => _then(v as _FriendState));

  @override
  _FriendState get _value => super._value as _FriendState;

  @override
  $Res call({
    Object allFriends = freezed,
    Object onlineFriends = freezed,
    Object offlineFriends = freezed,
    Object friendRequests = freezed,
    Object failure = freezed,
  }) {
    return _then(_FriendState(
      allFriends: allFriends == freezed
          ? _value.allFriends
          : allFriends as List<Friend>,
      onlineFriends: onlineFriends == freezed
          ? _value.onlineFriends
          : onlineFriends as List<Friend>,
      offlineFriends: offlineFriends == freezed
          ? _value.offlineFriends
          : offlineFriends as List<Friend>,
      friendRequests: friendRequests == freezed
          ? _value.friendRequests
          : friendRequests as List<FriendRequest>,
      failure: failure == freezed ? _value.failure : failure as FriendFailure,
    ));
  }
}

/// @nodoc
class _$_FriendState implements _FriendState {
  const _$_FriendState(
      {@required this.allFriends,
      @required this.onlineFriends,
      @required this.offlineFriends,
      @required this.friendRequests,
      this.failure})
      : assert(allFriends != null),
        assert(onlineFriends != null),
        assert(offlineFriends != null),
        assert(friendRequests != null);

  @override
  final List<Friend> allFriends;
  @override
  final List<Friend> onlineFriends;
  @override
  final List<Friend> offlineFriends;
  @override
  final List<FriendRequest> friendRequests;
  @override
  final FriendFailure failure;

  @override
  String toString() {
    return 'FriendState(allFriends: $allFriends, onlineFriends: $onlineFriends, offlineFriends: $offlineFriends, friendRequests: $friendRequests, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FriendState &&
            (identical(other.allFriends, allFriends) ||
                const DeepCollectionEquality()
                    .equals(other.allFriends, allFriends)) &&
            (identical(other.onlineFriends, onlineFriends) ||
                const DeepCollectionEquality()
                    .equals(other.onlineFriends, onlineFriends)) &&
            (identical(other.offlineFriends, offlineFriends) ||
                const DeepCollectionEquality()
                    .equals(other.offlineFriends, offlineFriends)) &&
            (identical(other.friendRequests, friendRequests) ||
                const DeepCollectionEquality()
                    .equals(other.friendRequests, friendRequests)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(allFriends) ^
      const DeepCollectionEquality().hash(onlineFriends) ^
      const DeepCollectionEquality().hash(offlineFriends) ^
      const DeepCollectionEquality().hash(friendRequests) ^
      const DeepCollectionEquality().hash(failure);

  @override
  _$FriendStateCopyWith<_FriendState> get copyWith =>
      __$FriendStateCopyWithImpl<_FriendState>(this, _$identity);
}

abstract class _FriendState implements FriendState {
  const factory _FriendState(
      {@required List<Friend> allFriends,
      @required List<Friend> onlineFriends,
      @required List<Friend> offlineFriends,
      @required List<FriendRequest> friendRequests,
      FriendFailure failure}) = _$_FriendState;

  @override
  List<Friend> get allFriends;
  @override
  List<Friend> get onlineFriends;
  @override
  List<Friend> get offlineFriends;
  @override
  List<FriendRequest> get friendRequests;
  @override
  FriendFailure get failure;
  @override
  _$FriendStateCopyWith<_FriendState> get copyWith;
}
