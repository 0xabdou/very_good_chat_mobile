// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserToCreateTearOff {
  const _$UserToCreateTearOff();

// ignore: unused_element
  _UserToCreate call(
      {@required String authProviderAccessToken,
      @required String username,
      String name,
      Uint8List photo}) {
    return _UserToCreate(
      authProviderAccessToken: authProviderAccessToken,
      username: username,
      name: name,
      photo: photo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserToCreate = _$UserToCreateTearOff();

/// @nodoc
mixin _$UserToCreate {
  String get authProviderAccessToken;
  String get username;
  String get name;
  Uint8List get photo;

  $UserToCreateCopyWith<UserToCreate> get copyWith;
}

/// @nodoc
abstract class $UserToCreateCopyWith<$Res> {
  factory $UserToCreateCopyWith(
          UserToCreate value, $Res Function(UserToCreate) then) =
      _$UserToCreateCopyWithImpl<$Res>;
  $Res call(
      {String authProviderAccessToken,
      String username,
      String name,
      Uint8List photo});
}

/// @nodoc
class _$UserToCreateCopyWithImpl<$Res> implements $UserToCreateCopyWith<$Res> {
  _$UserToCreateCopyWithImpl(this._value, this._then);

  final UserToCreate _value;
  // ignore: unused_field
  final $Res Function(UserToCreate) _then;

  @override
  $Res call({
    Object authProviderAccessToken = freezed,
    Object username = freezed,
    Object name = freezed,
    Object photo = freezed,
  }) {
    return _then(_value.copyWith(
      authProviderAccessToken: authProviderAccessToken == freezed
          ? _value.authProviderAccessToken
          : authProviderAccessToken as String,
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as Uint8List,
    ));
  }
}

/// @nodoc
abstract class _$UserToCreateCopyWith<$Res>
    implements $UserToCreateCopyWith<$Res> {
  factory _$UserToCreateCopyWith(
          _UserToCreate value, $Res Function(_UserToCreate) then) =
      __$UserToCreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String authProviderAccessToken,
      String username,
      String name,
      Uint8List photo});
}

/// @nodoc
class __$UserToCreateCopyWithImpl<$Res> extends _$UserToCreateCopyWithImpl<$Res>
    implements _$UserToCreateCopyWith<$Res> {
  __$UserToCreateCopyWithImpl(
      _UserToCreate _value, $Res Function(_UserToCreate) _then)
      : super(_value, (v) => _then(v as _UserToCreate));

  @override
  _UserToCreate get _value => super._value as _UserToCreate;

  @override
  $Res call({
    Object authProviderAccessToken = freezed,
    Object username = freezed,
    Object name = freezed,
    Object photo = freezed,
  }) {
    return _then(_UserToCreate(
      authProviderAccessToken: authProviderAccessToken == freezed
          ? _value.authProviderAccessToken
          : authProviderAccessToken as String,
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as Uint8List,
    ));
  }
}

/// @nodoc
class _$_UserToCreate implements _UserToCreate {
  const _$_UserToCreate(
      {@required this.authProviderAccessToken,
      @required this.username,
      this.name,
      this.photo})
      : assert(authProviderAccessToken != null),
        assert(username != null);

  @override
  final String authProviderAccessToken;
  @override
  final String username;
  @override
  final String name;
  @override
  final Uint8List photo;

  @override
  String toString() {
    return 'UserToCreate(authProviderAccessToken: $authProviderAccessToken, username: $username, name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserToCreate &&
            (identical(
                    other.authProviderAccessToken, authProviderAccessToken) ||
                const DeepCollectionEquality().equals(
                    other.authProviderAccessToken, authProviderAccessToken)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authProviderAccessToken) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photo);

  @override
  _$UserToCreateCopyWith<_UserToCreate> get copyWith =>
      __$UserToCreateCopyWithImpl<_UserToCreate>(this, _$identity);
}

abstract class _UserToCreate implements UserToCreate {
  const factory _UserToCreate(
      {@required String authProviderAccessToken,
      @required String username,
      String name,
      Uint8List photo}) = _$_UserToCreate;

  @override
  String get authProviderAccessToken;
  @override
  String get username;
  @override
  String get name;
  @override
  Uint8List get photo;
  @override
  _$UserToCreateCopyWith<_UserToCreate> get copyWith;
}

SignedInUser _$SignedInUserFromJson(Map<String, dynamic> json) {
  return _SignedInUser.fromJson(json);
}

/// @nodoc
class _$SignedInUserTearOff {
  const _$SignedInUserTearOff();

// ignore: unused_element
  _SignedInUser call(
      {@required @requiredNotNull String accessToken,
      @required @requiredNotNull String id,
      @required @requiredNotNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl}) {
    return _SignedInUser(
      accessToken: accessToken,
      id: id,
      username: username,
      name: name,
      photoUrl: photoUrl,
    );
  }

// ignore: unused_element
  SignedInUser fromJson(Map<String, Object> json) {
    return SignedInUser.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SignedInUser = _$SignedInUserTearOff();

/// @nodoc
mixin _$SignedInUser {
  @requiredNotNull
  String get accessToken;
  @requiredNotNull
  String get id;
  @requiredNotNull
  String get username;
  @doNotIncludeIfNull
  String get name;
  @doNotIncludeIfNull
  String get photoUrl;

  Map<String, dynamic> toJson();
  $SignedInUserCopyWith<SignedInUser> get copyWith;
}

/// @nodoc
abstract class $SignedInUserCopyWith<$Res> {
  factory $SignedInUserCopyWith(
          SignedInUser value, $Res Function(SignedInUser) then) =
      _$SignedInUserCopyWithImpl<$Res>;
  $Res call(
      {@requiredNotNull String accessToken,
      @requiredNotNull String id,
      @requiredNotNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl});
}

/// @nodoc
class _$SignedInUserCopyWithImpl<$Res> implements $SignedInUserCopyWith<$Res> {
  _$SignedInUserCopyWithImpl(this._value, this._then);

  final SignedInUser _value;
  // ignore: unused_field
  final $Res Function(SignedInUser) _then;

  @override
  $Res call({
    Object accessToken = freezed,
    Object id = freezed,
    Object username = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      id: id == freezed ? _value.id : id as String,
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$SignedInUserCopyWith<$Res>
    implements $SignedInUserCopyWith<$Res> {
  factory _$SignedInUserCopyWith(
          _SignedInUser value, $Res Function(_SignedInUser) then) =
      __$SignedInUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@requiredNotNull String accessToken,
      @requiredNotNull String id,
      @requiredNotNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl});
}

/// @nodoc
class __$SignedInUserCopyWithImpl<$Res> extends _$SignedInUserCopyWithImpl<$Res>
    implements _$SignedInUserCopyWith<$Res> {
  __$SignedInUserCopyWithImpl(
      _SignedInUser _value, $Res Function(_SignedInUser) _then)
      : super(_value, (v) => _then(v as _SignedInUser));

  @override
  _SignedInUser get _value => super._value as _SignedInUser;

  @override
  $Res call({
    Object accessToken = freezed,
    Object id = freezed,
    Object username = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_SignedInUser(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      id: id == freezed ? _value.id : id as String,
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SignedInUser implements _SignedInUser {
  const _$_SignedInUser(
      {@required @requiredNotNull this.accessToken,
      @required @requiredNotNull this.id,
      @required @requiredNotNull this.username,
      @doNotIncludeIfNull this.name,
      @doNotIncludeIfNull this.photoUrl})
      : assert(accessToken != null),
        assert(id != null),
        assert(username != null);

  factory _$_SignedInUser.fromJson(Map<String, dynamic> json) =>
      _$_$_SignedInUserFromJson(json);

  @override
  @requiredNotNull
  final String accessToken;
  @override
  @requiredNotNull
  final String id;
  @override
  @requiredNotNull
  final String username;
  @override
  @doNotIncludeIfNull
  final String name;
  @override
  @doNotIncludeIfNull
  final String photoUrl;

  @override
  String toString() {
    return 'SignedInUser(accessToken: $accessToken, id: $id, username: $username, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignedInUser &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl);

  @override
  _$SignedInUserCopyWith<_SignedInUser> get copyWith =>
      __$SignedInUserCopyWithImpl<_SignedInUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignedInUserToJson(this);
  }
}

abstract class _SignedInUser implements SignedInUser {
  const factory _SignedInUser(
      {@required @requiredNotNull String accessToken,
      @required @requiredNotNull String id,
      @required @requiredNotNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl}) = _$_SignedInUser;

  factory _SignedInUser.fromJson(Map<String, dynamic> json) =
      _$_SignedInUser.fromJson;

  @override
  @requiredNotNull
  String get accessToken;
  @override
  @requiredNotNull
  String get id;
  @override
  @requiredNotNull
  String get username;
  @override
  @doNotIncludeIfNull
  String get name;
  @override
  @doNotIncludeIfNull
  String get photoUrl;
  @override
  _$SignedInUserCopyWith<_SignedInUser> get copyWith;
}

UserUpdates _$UserUpdatesFromJson(Map<String, dynamic> json) {
  return _UserUpdates.fromJson(json);
}

/// @nodoc
class _$UserUpdatesTearOff {
  const _$UserUpdatesTearOff();

// ignore: unused_element
  _UserUpdates call(
      {@doNotIncludeIfNull String username, @doNotIncludeIfNull String name}) {
    return _UserUpdates(
      username: username,
      name: name,
    );
  }

// ignore: unused_element
  UserUpdates fromJson(Map<String, Object> json) {
    return UserUpdates.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserUpdates = _$UserUpdatesTearOff();

/// @nodoc
mixin _$UserUpdates {
  @doNotIncludeIfNull
  String get username;
  @doNotIncludeIfNull
  String get name;

  Map<String, dynamic> toJson();
  $UserUpdatesCopyWith<UserUpdates> get copyWith;
}

/// @nodoc
abstract class $UserUpdatesCopyWith<$Res> {
  factory $UserUpdatesCopyWith(
          UserUpdates value, $Res Function(UserUpdates) then) =
      _$UserUpdatesCopyWithImpl<$Res>;
  $Res call(
      {@doNotIncludeIfNull String username, @doNotIncludeIfNull String name});
}

/// @nodoc
class _$UserUpdatesCopyWithImpl<$Res> implements $UserUpdatesCopyWith<$Res> {
  _$UserUpdatesCopyWithImpl(this._value, this._then);

  final UserUpdates _value;
  // ignore: unused_field
  final $Res Function(UserUpdates) _then;

  @override
  $Res call({
    Object username = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$UserUpdatesCopyWith<$Res>
    implements $UserUpdatesCopyWith<$Res> {
  factory _$UserUpdatesCopyWith(
          _UserUpdates value, $Res Function(_UserUpdates) then) =
      __$UserUpdatesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@doNotIncludeIfNull String username, @doNotIncludeIfNull String name});
}

/// @nodoc
class __$UserUpdatesCopyWithImpl<$Res> extends _$UserUpdatesCopyWithImpl<$Res>
    implements _$UserUpdatesCopyWith<$Res> {
  __$UserUpdatesCopyWithImpl(
      _UserUpdates _value, $Res Function(_UserUpdates) _then)
      : super(_value, (v) => _then(v as _UserUpdates));

  @override
  _UserUpdates get _value => super._value as _UserUpdates;

  @override
  $Res call({
    Object username = freezed,
    Object name = freezed,
  }) {
    return _then(_UserUpdates(
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserUpdates extends _UserUpdates {
  const _$_UserUpdates(
      {@doNotIncludeIfNull this.username, @doNotIncludeIfNull this.name})
      : super._();

  factory _$_UserUpdates.fromJson(Map<String, dynamic> json) =>
      _$_$_UserUpdatesFromJson(json);

  @override
  @doNotIncludeIfNull
  final String username;
  @override
  @doNotIncludeIfNull
  final String name;

  @override
  String toString() {
    return 'UserUpdates(username: $username, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserUpdates &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$UserUpdatesCopyWith<_UserUpdates> get copyWith =>
      __$UserUpdatesCopyWithImpl<_UserUpdates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserUpdatesToJson(this);
  }
}

abstract class _UserUpdates extends UserUpdates {
  const _UserUpdates._() : super._();
  const factory _UserUpdates(
      {@doNotIncludeIfNull String username,
      @doNotIncludeIfNull String name}) = _$_UserUpdates;

  factory _UserUpdates.fromJson(Map<String, dynamic> json) =
      _$_UserUpdates.fromJson;

  @override
  @doNotIncludeIfNull
  String get username;
  @override
  @doNotIncludeIfNull
  String get name;
  @override
  _$UserUpdatesCopyWith<_UserUpdates> get copyWith;
}
