// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserDtoToSendTearOff {
  const _$UserDtoToSendTearOff();

// ignore: unused_element
  _UserDtoToSend call(
      {@required String authProviderAccessToken,
      @required String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull Uint8List photo}) {
    return _UserDtoToSend(
      authProviderAccessToken: authProviderAccessToken,
      username: username,
      name: name,
      photo: photo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserDtoToSend = _$UserDtoToSendTearOff();

/// @nodoc
mixin _$UserDtoToSend {
  String get authProviderAccessToken;
  String get username;
  @doNotIncludeIfNull
  String get name;
  @doNotIncludeIfNull
  Uint8List get photo;

  $UserDtoToSendCopyWith<UserDtoToSend> get copyWith;
}

/// @nodoc
abstract class $UserDtoToSendCopyWith<$Res> {
  factory $UserDtoToSendCopyWith(
          UserDtoToSend value, $Res Function(UserDtoToSend) then) =
      _$UserDtoToSendCopyWithImpl<$Res>;
  $Res call(
      {String authProviderAccessToken,
      String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull Uint8List photo});
}

/// @nodoc
class _$UserDtoToSendCopyWithImpl<$Res>
    implements $UserDtoToSendCopyWith<$Res> {
  _$UserDtoToSendCopyWithImpl(this._value, this._then);

  final UserDtoToSend _value;
  // ignore: unused_field
  final $Res Function(UserDtoToSend) _then;

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
abstract class _$UserDtoToSendCopyWith<$Res>
    implements $UserDtoToSendCopyWith<$Res> {
  factory _$UserDtoToSendCopyWith(
          _UserDtoToSend value, $Res Function(_UserDtoToSend) then) =
      __$UserDtoToSendCopyWithImpl<$Res>;
  @override
  $Res call(
      {String authProviderAccessToken,
      String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull Uint8List photo});
}

/// @nodoc
class __$UserDtoToSendCopyWithImpl<$Res>
    extends _$UserDtoToSendCopyWithImpl<$Res>
    implements _$UserDtoToSendCopyWith<$Res> {
  __$UserDtoToSendCopyWithImpl(
      _UserDtoToSend _value, $Res Function(_UserDtoToSend) _then)
      : super(_value, (v) => _then(v as _UserDtoToSend));

  @override
  _UserDtoToSend get _value => super._value as _UserDtoToSend;

  @override
  $Res call({
    Object authProviderAccessToken = freezed,
    Object username = freezed,
    Object name = freezed,
    Object photo = freezed,
  }) {
    return _then(_UserDtoToSend(
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
class _$_UserDtoToSend implements _UserDtoToSend {
  const _$_UserDtoToSend(
      {@required this.authProviderAccessToken,
      @required this.username,
      @doNotIncludeIfNull this.name,
      @doNotIncludeIfNull this.photo})
      : assert(authProviderAccessToken != null),
        assert(username != null);

  @override
  final String authProviderAccessToken;
  @override
  final String username;
  @override
  @doNotIncludeIfNull
  final String name;
  @override
  @doNotIncludeIfNull
  final Uint8List photo;

  @override
  String toString() {
    return 'UserDtoToSend(authProviderAccessToken: $authProviderAccessToken, username: $username, name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDtoToSend &&
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
  _$UserDtoToSendCopyWith<_UserDtoToSend> get copyWith =>
      __$UserDtoToSendCopyWithImpl<_UserDtoToSend>(this, _$identity);
}

abstract class _UserDtoToSend implements UserDtoToSend {
  const factory _UserDtoToSend(
      {@required String authProviderAccessToken,
      @required String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull Uint8List photo}) = _$_UserDtoToSend;

  @override
  String get authProviderAccessToken;
  @override
  String get username;
  @override
  @doNotIncludeIfNull
  String get name;
  @override
  @doNotIncludeIfNull
  Uint8List get photo;
  @override
  _$UserDtoToSendCopyWith<_UserDtoToSend> get copyWith;
}

UserDtoReceived _$UserDtoReceivedFromJson(Map<String, dynamic> json) {
  return _Received.fromJson(json);
}

/// @nodoc
class _$UserDtoReceivedTearOff {
  const _$UserDtoReceivedTearOff();

// ignore: unused_element
  _Received call(
      {@required @requiredNonNull String accessToken,
      @required @requiredNonNull String id,
      @required @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl}) {
    return _Received(
      accessToken: accessToken,
      id: id,
      username: username,
      name: name,
      photoUrl: photoUrl,
    );
  }

// ignore: unused_element
  UserDtoReceived fromJson(Map<String, Object> json) {
    return UserDtoReceived.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserDtoReceived = _$UserDtoReceivedTearOff();

/// @nodoc
mixin _$UserDtoReceived {
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
  $UserDtoReceivedCopyWith<UserDtoReceived> get copyWith;
}

/// @nodoc
abstract class $UserDtoReceivedCopyWith<$Res> {
  factory $UserDtoReceivedCopyWith(
          UserDtoReceived value, $Res Function(UserDtoReceived) then) =
      _$UserDtoReceivedCopyWithImpl<$Res>;
  $Res call(
      {@requiredNonNull String accessToken,
      @requiredNonNull String id,
      @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl});
}

/// @nodoc
class _$UserDtoReceivedCopyWithImpl<$Res>
    implements $UserDtoReceivedCopyWith<$Res> {
  _$UserDtoReceivedCopyWithImpl(this._value, this._then);

  final UserDtoReceived _value;
  // ignore: unused_field
  final $Res Function(UserDtoReceived) _then;

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
abstract class _$ReceivedCopyWith<$Res>
    implements $UserDtoReceivedCopyWith<$Res> {
  factory _$ReceivedCopyWith(_Received value, $Res Function(_Received) then) =
      __$ReceivedCopyWithImpl<$Res>;
  @override
  $Res call(
      {@requiredNonNull String accessToken,
      @requiredNonNull String id,
      @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl});
}

/// @nodoc
class __$ReceivedCopyWithImpl<$Res> extends _$UserDtoReceivedCopyWithImpl<$Res>
    implements _$ReceivedCopyWith<$Res> {
  __$ReceivedCopyWithImpl(_Received _value, $Res Function(_Received) _then)
      : super(_value, (v) => _then(v as _Received));

  @override
  _Received get _value => super._value as _Received;

  @override
  $Res call({
    Object accessToken = freezed,
    Object id = freezed,
    Object username = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_Received(
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
class _$_Received implements _Received {
  const _$_Received(
      {@required @requiredNonNull this.accessToken,
      @required @requiredNonNull this.id,
      @required @requiredNonNull this.username,
      @doNotIncludeIfNull this.name,
      @doNotIncludeIfNull this.photoUrl})
      : assert(accessToken != null),
        assert(id != null),
        assert(username != null);

  factory _$_Received.fromJson(Map<String, dynamic> json) =>
      _$_$_ReceivedFromJson(json);

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
    return 'UserDtoReceived(accessToken: $accessToken, id: $id, username: $username, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Received &&
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
  _$ReceivedCopyWith<_Received> get copyWith =>
      __$ReceivedCopyWithImpl<_Received>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReceivedToJson(this);
  }
}

abstract class _Received implements UserDtoReceived {
  const factory _Received(
      {@required @requiredNonNull String accessToken,
      @required @requiredNonNull String id,
      @required @requiredNonNull String username,
      @doNotIncludeIfNull String name,
      @doNotIncludeIfNull String photoUrl}) = _$_Received;

  factory _Received.fromJson(Map<String, dynamic> json) = _$_Received.fromJson;

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
  _$ReceivedCopyWith<_Received> get copyWith;
}
