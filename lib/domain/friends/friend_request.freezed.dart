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
      {@required @requiredNotNull String userId,
      @required @_sentAtJsonKey DateTime sentAt,
      @required @requiredNotNull bool sent}) {
    return _FriendRequest(
      userId: userId,
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
  String get userId;
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
      {@requiredNotNull String userId,
      @_sentAtJsonKey DateTime sentAt,
      @requiredNotNull bool sent});
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
    Object userId = freezed,
    Object sentAt = freezed,
    Object sent = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String,
      sentAt: sentAt == freezed ? _value.sentAt : sentAt as DateTime,
      sent: sent == freezed ? _value.sent : sent as bool,
    ));
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
      {@requiredNotNull String userId,
      @_sentAtJsonKey DateTime sentAt,
      @requiredNotNull bool sent});
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
    Object userId = freezed,
    Object sentAt = freezed,
    Object sent = freezed,
  }) {
    return _then(_FriendRequest(
      userId: userId == freezed ? _value.userId : userId as String,
      sentAt: sentAt == freezed ? _value.sentAt : sentAt as DateTime,
      sent: sent == freezed ? _value.sent : sent as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FriendRequest implements _FriendRequest {
  const _$_FriendRequest(
      {@required @requiredNotNull this.userId,
      @required @_sentAtJsonKey this.sentAt,
      @required @requiredNotNull this.sent})
      : assert(userId != null),
        assert(sentAt != null),
        assert(sent != null);

  factory _$_FriendRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_FriendRequestFromJson(json);

  @override
  @requiredNotNull
  final String userId;
  @override
  @_sentAtJsonKey
  final DateTime sentAt;
  @override
  @requiredNotNull
  final bool sent;

  @override
  String toString() {
    return 'FriendRequest(userId: $userId, sentAt: $sentAt, sent: $sent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FriendRequest &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.sentAt, sentAt) ||
                const DeepCollectionEquality().equals(other.sentAt, sentAt)) &&
            (identical(other.sent, sent) ||
                const DeepCollectionEquality().equals(other.sent, sent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
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
      {@required @requiredNotNull String userId,
      @required @_sentAtJsonKey DateTime sentAt,
      @required @requiredNotNull bool sent}) = _$_FriendRequest;

  factory _FriendRequest.fromJson(Map<String, dynamic> json) =
      _$_FriendRequest.fromJson;

  @override
  @requiredNotNull
  String get userId;
  @override
  @_sentAtJsonKey
  DateTime get sentAt;
  @override
  @requiredNotNull
  bool get sent;
  @override
  _$FriendRequestCopyWith<_FriendRequest> get copyWith;
}
