// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
class _$FriendTearOff {
  const _$FriendTearOff();

// ignore: unused_element
  _Friend call(
      {@required @requiredNotNull String id,
      @required @requiredNotNull String username,
      @JsonKey(ignore: true) bool isOnline = false,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl,
      @_lastSeenJsonKey DateTime lastSeen}) {
    return _Friend(
      id: id,
      username: username,
      isOnline: isOnline,
      name: name,
      photoUrl: photoUrl,
      lastSeen: lastSeen,
    );
  }

// ignore: unused_element
  Friend fromJson(Map<String, Object> json) {
    return Friend.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Friend = _$FriendTearOff();

/// @nodoc
mixin _$Friend {
  @requiredNotNull
  String get id;
  @requiredNotNull
  String get username;
  @JsonKey(ignore: true)
  bool get isOnline;
  @doNotIncludeIfNull
  String get name;
  @doNotIncludeIfNull
  String get photoUrl;
  @_lastSeenJsonKey
  DateTime get lastSeen;

  Map<String, dynamic> toJson();
  $FriendCopyWith<Friend> get copyWith;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res>;
  $Res call(
      {@requiredNotNull String id,
      @requiredNotNull String username,
      @JsonKey(ignore: true) bool isOnline,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl,
      @_lastSeenJsonKey DateTime lastSeen});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res> implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  final Friend _value;
  // ignore: unused_field
  final $Res Function(Friend) _then;

  @override
  $Res call({
    Object id = freezed,
    Object username = freezed,
    Object isOnline = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      username: username == freezed ? _value.username : username as String,
      isOnline: isOnline == freezed ? _value.isOnline : isOnline as bool,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$FriendCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$FriendCopyWith(_Friend value, $Res Function(_Friend) then) =
      __$FriendCopyWithImpl<$Res>;
  @override
  $Res call(
      {@requiredNotNull String id,
      @requiredNotNull String username,
      @JsonKey(ignore: true) bool isOnline,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl,
      @_lastSeenJsonKey DateTime lastSeen});
}

/// @nodoc
class __$FriendCopyWithImpl<$Res> extends _$FriendCopyWithImpl<$Res>
    implements _$FriendCopyWith<$Res> {
  __$FriendCopyWithImpl(_Friend _value, $Res Function(_Friend) _then)
      : super(_value, (v) => _then(v as _Friend));

  @override
  _Friend get _value => super._value as _Friend;

  @override
  $Res call({
    Object id = freezed,
    Object username = freezed,
    Object isOnline = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_Friend(
      id: id == freezed ? _value.id : id as String,
      username: username == freezed ? _value.username : username as String,
      isOnline: isOnline == freezed ? _value.isOnline : isOnline as bool,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Friend extends _Friend {
  const _$_Friend(
      {@required @requiredNotNull this.id,
      @required @requiredNotNull this.username,
      @JsonKey(ignore: true) this.isOnline = false,
      @doNotIncludeIfNull this.name,
      @doNotIncludeIfNull this.photoUrl,
      @_lastSeenJsonKey this.lastSeen})
      : assert(id != null),
        assert(username != null),
        assert(isOnline != null),
        super._();

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$_$_FriendFromJson(json);

  @override
  @requiredNotNull
  final String id;
  @override
  @requiredNotNull
  final String username;
  @override
  @JsonKey(ignore: true)
  final bool isOnline;
  @override
  @doNotIncludeIfNull
  final String name;
  @override
  @doNotIncludeIfNull
  final String photoUrl;
  @override
  @_lastSeenJsonKey
  final DateTime lastSeen;

  @override
  String toString() {
    return 'Friend(id: $id, username: $username, isOnline: $isOnline, name: $name, photoUrl: $photoUrl, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Friend &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.isOnline, isOnline) ||
                const DeepCollectionEquality()
                    .equals(other.isOnline, isOnline)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.lastSeen, lastSeen) ||
                const DeepCollectionEquality()
                    .equals(other.lastSeen, lastSeen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(isOnline) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(lastSeen);

  @override
  _$FriendCopyWith<_Friend> get copyWith =>
      __$FriendCopyWithImpl<_Friend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FriendToJson(this);
  }
}

abstract class _Friend extends Friend {
  const _Friend._() : super._();
  const factory _Friend(
      {@required @requiredNotNull String id,
      @required @requiredNotNull String username,
      @JsonKey(ignore: true) bool isOnline,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl,
      @_lastSeenJsonKey DateTime lastSeen}) = _$_Friend;

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  @requiredNotNull
  String get id;
  @override
  @requiredNotNull
  String get username;
  @override
  @JsonKey(ignore: true)
  bool get isOnline;
  @override
  @doNotIncludeIfNull
  String get name;
  @override
  @doNotIncludeIfNull
  String get photoUrl;
  @override
  @_lastSeenJsonKey
  DateTime get lastSeen;
  @override
  _$FriendCopyWith<_Friend> get copyWith;
}
