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

UserCreated _$UserCreatedFromJson(Map<String, dynamic> json) {
  return _UserCreated.fromJson(json);
}

/// @nodoc
class _$UserCreatedTearOff {
  const _$UserCreatedTearOff();

// ignore: unused_element
  _UserCreated call(
      {@required @requiredNonNull String accessToken,
      @required @requiredNonNull String id,
      @required @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl}) {
    return _UserCreated(
      accessToken: accessToken,
      id: id,
      username: username,
      name: name,
      photoUrl: photoUrl,
    );
  }

// ignore: unused_element
  UserCreated fromJson(Map<String, Object> json) {
    return UserCreated.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserCreated = _$UserCreatedTearOff();

/// @nodoc
mixin _$UserCreated {
  @requiredNonNull
  String get accessToken;
  @requiredNonNull
  String get id;
  @requiredNonNull
  String get username;
  @doNotIncludeIfNull
  String get name;
  @doNotIncludeIfNull
  String get photoUrl;

  Map<String, dynamic> toJson();
  $UserCreatedCopyWith<UserCreated> get copyWith;
}

/// @nodoc
abstract class $UserCreatedCopyWith<$Res> {
  factory $UserCreatedCopyWith(
          UserCreated value, $Res Function(UserCreated) then) =
      _$UserCreatedCopyWithImpl<$Res>;
  $Res call(
      {@requiredNonNull String accessToken,
      @requiredNonNull String id,
      @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl});
}

/// @nodoc
class _$UserCreatedCopyWithImpl<$Res> implements $UserCreatedCopyWith<$Res> {
  _$UserCreatedCopyWithImpl(this._value, this._then);

  final UserCreated _value;
  // ignore: unused_field
  final $Res Function(UserCreated) _then;

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
abstract class _$UserCreatedCopyWith<$Res>
    implements $UserCreatedCopyWith<$Res> {
  factory _$UserCreatedCopyWith(
          _UserCreated value, $Res Function(_UserCreated) then) =
      __$UserCreatedCopyWithImpl<$Res>;
  @override
  $Res call(
      {@requiredNonNull String accessToken,
      @requiredNonNull String id,
      @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl});
}

/// @nodoc
class __$UserCreatedCopyWithImpl<$Res> extends _$UserCreatedCopyWithImpl<$Res>
    implements _$UserCreatedCopyWith<$Res> {
  __$UserCreatedCopyWithImpl(
      _UserCreated _value, $Res Function(_UserCreated) _then)
      : super(_value, (v) => _then(v as _UserCreated));

  @override
  _UserCreated get _value => super._value as _UserCreated;

  @override
  $Res call({
    Object accessToken = freezed,
    Object id = freezed,
    Object username = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_UserCreated(
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
class _$_UserCreated implements _UserCreated {
  const _$_UserCreated(
      {@required @requiredNonNull this.accessToken,
      @required @requiredNonNull this.id,
      @required @requiredNonNull this.username,
      @doNotIncludeIfNull this.name,
      @doNotIncludeIfNull this.photoUrl})
      : assert(accessToken != null),
        assert(id != null),
        assert(username != null);

  factory _$_UserCreated.fromJson(Map<String, dynamic> json) =>
      _$_$_UserCreatedFromJson(json);

  @override
  @requiredNonNull
  final String accessToken;
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
  String toString() {
    return 'UserCreated(accessToken: $accessToken, id: $id, username: $username, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserCreated &&
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
  _$UserCreatedCopyWith<_UserCreated> get copyWith =>
      __$UserCreatedCopyWithImpl<_UserCreated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserCreatedToJson(this);
  }
}

abstract class _UserCreated implements UserCreated {
  const factory _UserCreated(
      {@required @requiredNonNull String accessToken,
      @required @requiredNonNull String id,
      @required @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl}) = _$_UserCreated;

  factory _UserCreated.fromJson(Map<String, dynamic> json) =
      _$_UserCreated.fromJson;

  @override
  @requiredNonNull
  String get accessToken;
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
  _$UserCreatedCopyWith<_UserCreated> get copyWith;
}
