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
      {@required List<Friend> friends,
      @required List<FriendRequest> friendRequests,
      FriendFailure failure}) {
    return _FriendState(
      friends: friends,
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
  List<Friend> get friends;
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
      {List<Friend> friends,
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
    Object friends = freezed,
    Object friendRequests = freezed,
    Object failure = freezed,
  }) {
    return _then(_value.copyWith(
      friends: friends == freezed ? _value.friends : friends as List<Friend>,
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
      {List<Friend> friends,
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
    Object friends = freezed,
    Object friendRequests = freezed,
    Object failure = freezed,
  }) {
    return _then(_FriendState(
      friends: friends == freezed ? _value.friends : friends as List<Friend>,
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
      {@required this.friends, @required this.friendRequests, this.failure})
      : assert(friends != null),
        assert(friendRequests != null);

  @override
  final List<Friend> friends;
  @override
  final List<FriendRequest> friendRequests;
  @override
  final FriendFailure failure;

  @override
  String toString() {
    return 'FriendState(friends: $friends, friendRequests: $friendRequests, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FriendState &&
            (identical(other.friends, friends) ||
                const DeepCollectionEquality()
                    .equals(other.friends, friends)) &&
            (identical(other.friendRequests, friendRequests) ||
                const DeepCollectionEquality()
                    .equals(other.friendRequests, friendRequests)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(friends) ^
      const DeepCollectionEquality().hash(friendRequests) ^
      const DeepCollectionEquality().hash(failure);

  @override
  _$FriendStateCopyWith<_FriendState> get copyWith =>
      __$FriendStateCopyWithImpl<_FriendState>(this, _$identity);
}

abstract class _FriendState implements FriendState {
  const factory _FriendState(
      {@required List<Friend> friends,
      @required List<FriendRequest> friendRequests,
      FriendFailure failure}) = _$_FriendState;

  @override
  List<Friend> get friends;
  @override
  List<FriendRequest> get friendRequests;
  @override
  FriendFailure get failure;
  @override
  _$FriendStateCopyWith<_FriendState> get copyWith;
}
