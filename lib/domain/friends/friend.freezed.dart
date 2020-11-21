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
      {@required
      @requiredNonNull
          String id,
      @required
      @requiredNonNull
          String username,
      @doNotIncludeIfNull
          String name,
      @doNotIncludeIfNull
          String photoUrl,
      @JsonKey(toJson: _lastSeenToJson, fromJson: _lastSeenFromJson, includeIfNull: false)
          DateTime lastSeen}) {
    return _Friend(
      id: id,
      username: username,
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
  @requiredNonNull
  String get id;
  @requiredNonNull
  String get username;
  @doNotIncludeIfNull
  String get name;
  @doNotIncludeIfNull
  String get photoUrl;
  @JsonKey(
      toJson: _lastSeenToJson,
      fromJson: _lastSeenFromJson,
      includeIfNull: false)
  DateTime get lastSeen;

  Map<String, dynamic> toJson();
  $FriendCopyWith<Friend> get copyWith;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res>;
  $Res call(
      {@requiredNonNull
          String id,
      @requiredNonNull
          String username,
      @doNotIncludeIfNull
          String name,
      @doNotIncludeIfNull
          String photoUrl,
      @JsonKey(toJson: _lastSeenToJson, fromJson: _lastSeenFromJson, includeIfNull: false)
          DateTime lastSeen});
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
    Object name = freezed,
    Object photoUrl = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      username: username == freezed ? _value.username : username as String,
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
      {@requiredNonNull
          String id,
      @requiredNonNull
          String username,
      @doNotIncludeIfNull
          String name,
      @doNotIncludeIfNull
          String photoUrl,
      @JsonKey(toJson: _lastSeenToJson, fromJson: _lastSeenFromJson, includeIfNull: false)
          DateTime lastSeen});
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
    Object name = freezed,
    Object photoUrl = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_Friend(
      id: id == freezed ? _value.id : id as String,
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Friend implements _Friend {
  const _$_Friend(
      {@required
      @requiredNonNull
          this.id,
      @required
      @requiredNonNull
          this.username,
      @doNotIncludeIfNull
          this.name,
      @doNotIncludeIfNull
          this.photoUrl,
      @JsonKey(toJson: _lastSeenToJson, fromJson: _lastSeenFromJson, includeIfNull: false)
          this.lastSeen})
      : assert(id != null),
        assert(username != null);

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$_$_FriendFromJson(json);

  @override
  @requiredNonNull
  final String id;
  @override
  @requiredNonNull
  final String username;
  @override
  @doNotIncludeIfNull
  final String name;
  @override
  @doNotIncludeIfNull
  final String photoUrl;
  @override
  @JsonKey(
      toJson: _lastSeenToJson,
      fromJson: _lastSeenFromJson,
      includeIfNull: false)
  final DateTime lastSeen;

  @override
  String toString() {
    return 'Friend(id: $id, username: $username, name: $name, photoUrl: $photoUrl, lastSeen: $lastSeen)';
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

abstract class _Friend implements Friend {
  const factory _Friend(
      {@required
      @requiredNonNull
          String id,
      @required
      @requiredNonNull
          String username,
      @doNotIncludeIfNull
          String name,
      @doNotIncludeIfNull
          String photoUrl,
      @JsonKey(toJson: _lastSeenToJson, fromJson: _lastSeenFromJson, includeIfNull: false)
          DateTime lastSeen}) = _$_Friend;

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  @requiredNonNull
  String get id;
  @override
  @requiredNonNull
  String get username;
  @override
  @doNotIncludeIfNull
  String get name;
  @override
  @doNotIncludeIfNull
  String get photoUrl;
  @override
  @JsonKey(
      toJson: _lastSeenToJson,
      fromJson: _lastSeenFromJson,
      includeIfNull: false)
  DateTime get lastSeen;
  @override
  _$FriendCopyWith<_Friend> get copyWith;
}
