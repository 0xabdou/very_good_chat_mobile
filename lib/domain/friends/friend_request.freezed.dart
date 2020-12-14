// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'friend_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) {
  return _FriendRequest.fromJson(json);
}

/// @nodoc
class _$FriendRequestTearOff {
  const _$FriendRequestTearOff();

// ignore: unused_element
  _FriendRequest call(
      {@required @requiredNotNull User user,
      @required @_sentAtJsonKey DateTime sentAt,
      @required @requiredNotNull bool sent}) {
    return _FriendRequest(
      user: user,
      sentAt: sentAt,
      sent: sent,
    );
  }

// ignore: unused_element
  FriendRequest fromJson(Map<String, Object> json) {
    return FriendRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FriendRequest = _$FriendRequestTearOff();

/// @nodoc
mixin _$FriendRequest {
  @requiredNotNull
  User get user;
  @_sentAtJsonKey
  DateTime get sentAt;
  @requiredNotNull
  bool get sent;

  Map<String, dynamic> toJson();
  $FriendRequestCopyWith<FriendRequest> get copyWith;
}

/// @nodoc
abstract class $FriendRequestCopyWith<$Res> {
  factory $FriendRequestCopyWith(
          FriendRequest value, $Res Function(FriendRequest) then) =
      _$FriendRequestCopyWithImpl<$Res>;
  $Res call(
      {@requiredNotNull User user,
      @_sentAtJsonKey DateTime sentAt,
      @requiredNotNull bool sent});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$FriendRequestCopyWithImpl<$Res>
    implements $FriendRequestCopyWith<$Res> {
  _$FriendRequestCopyWithImpl(this._value, this._then);

  final FriendRequest _value;
  // ignore: unused_field
  final $Res Function(FriendRequest) _then;

  @override
  $Res call({
    Object user = freezed,
    Object sentAt = freezed,
    Object sent = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed ? _value.user : user as User,
      sentAt: sentAt == freezed ? _value.sentAt : sentAt as DateTime,
      sent: sent == freezed ? _value.sent : sent as bool,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$FriendRequestCopyWith<$Res>
    implements $FriendRequestCopyWith<$Res> {
  factory _$FriendRequestCopyWith(
          _FriendRequest value, $Res Function(_FriendRequest) then) =
      __$FriendRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@requiredNotNull User user,
      @_sentAtJsonKey DateTime sentAt,
      @requiredNotNull bool sent});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$FriendRequestCopyWithImpl<$Res>
    extends _$FriendRequestCopyWithImpl<$Res>
    implements _$FriendRequestCopyWith<$Res> {
  __$FriendRequestCopyWithImpl(
      _FriendRequest _value, $Res Function(_FriendRequest) _then)
      : super(_value, (v) => _then(v as _FriendRequest));

  @override
  _FriendRequest get _value => super._value as _FriendRequest;

  @override
  $Res call({
    Object user = freezed,
    Object sentAt = freezed,
    Object sent = freezed,
  }) {
    return _then(_FriendRequest(
      user: user == freezed ? _value.user : user as User,
      sentAt: sentAt == freezed ? _value.sentAt : sentAt as DateTime,
      sent: sent == freezed ? _value.sent : sent as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FriendRequest implements _FriendRequest {
  const _$_FriendRequest(
      {@required @requiredNotNull this.user,
      @required @_sentAtJsonKey this.sentAt,
      @required @requiredNotNull this.sent})
      : assert(user != null),
        assert(sentAt != null),
        assert(sent != null);

  factory _$_FriendRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_FriendRequestFromJson(json);

  @override
  @requiredNotNull
  final User user;
  @override
  @_sentAtJsonKey
  final DateTime sentAt;
  @override
  @requiredNotNull
  final bool sent;

  @override
  String toString() {
    return 'FriendRequest(user: $user, sentAt: $sentAt, sent: $sent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FriendRequest &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.sentAt, sentAt) ||
                const DeepCollectionEquality().equals(other.sentAt, sentAt)) &&
            (identical(other.sent, sent) ||
                const DeepCollectionEquality().equals(other.sent, sent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(sentAt) ^
      const DeepCollectionEquality().hash(sent);

  @override
  _$FriendRequestCopyWith<_FriendRequest> get copyWith =>
      __$FriendRequestCopyWithImpl<_FriendRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FriendRequestToJson(this);
  }
}

abstract class _FriendRequest implements FriendRequest {
  const factory _FriendRequest(
      {@required @requiredNotNull User user,
      @required @_sentAtJsonKey DateTime sentAt,
      @required @requiredNotNull bool sent}) = _$_FriendRequest;

  factory _FriendRequest.fromJson(Map<String, dynamic> json) =
      _$_FriendRequest.fromJson;

  @override
  @requiredNotNull
  User get user;
  @override
  @_sentAtJsonKey
  DateTime get sentAt;
  @override
  @requiredNotNull
  bool get sent;
  @override
  _$FriendRequestCopyWith<_FriendRequest> get copyWith;
}
