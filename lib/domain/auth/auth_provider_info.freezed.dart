// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_provider_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthProviderInfoTearOff {
  const _$AuthProviderInfoTearOff();

// ignore: unused_element
  _AuthProviderInfo call(
      {@required String accessToken, String name, String photoUrl}) {
    return _AuthProviderInfo(
      accessToken: accessToken,
      name: name,
      photoUrl: photoUrl,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthProviderInfo = _$AuthProviderInfoTearOff();

/// @nodoc
mixin _$AuthProviderInfo {
  String get accessToken;
  String get name;
  String get photoUrl;

  $AuthProviderInfoCopyWith<AuthProviderInfo> get copyWith;
}

/// @nodoc
abstract class $AuthProviderInfoCopyWith<$Res> {
  factory $AuthProviderInfoCopyWith(
          AuthProviderInfo value, $Res Function(AuthProviderInfo) then) =
      _$AuthProviderInfoCopyWithImpl<$Res>;
  $Res call({String accessToken, String name, String photoUrl});
}

/// @nodoc
class _$AuthProviderInfoCopyWithImpl<$Res>
    implements $AuthProviderInfoCopyWith<$Res> {
  _$AuthProviderInfoCopyWithImpl(this._value, this._then);

  final AuthProviderInfo _value;
  // ignore: unused_field
  final $Res Function(AuthProviderInfo) _then;

  @override
  $Res call({
    Object accessToken = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthProviderInfoCopyWith<$Res>
    implements $AuthProviderInfoCopyWith<$Res> {
  factory _$AuthProviderInfoCopyWith(
          _AuthProviderInfo value, $Res Function(_AuthProviderInfo) then) =
      __$AuthProviderInfoCopyWithImpl<$Res>;
  @override
  $Res call({String accessToken, String name, String photoUrl});
}

/// @nodoc
class __$AuthProviderInfoCopyWithImpl<$Res>
    extends _$AuthProviderInfoCopyWithImpl<$Res>
    implements _$AuthProviderInfoCopyWith<$Res> {
  __$AuthProviderInfoCopyWithImpl(
      _AuthProviderInfo _value, $Res Function(_AuthProviderInfo) _then)
      : super(_value, (v) => _then(v as _AuthProviderInfo));

  @override
  _AuthProviderInfo get _value => super._value as _AuthProviderInfo;

  @override
  $Res call({
    Object accessToken = freezed,
    Object name = freezed,
    Object photoUrl = freezed,
  }) {
    return _then(_AuthProviderInfo(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      name: name == freezed ? _value.name : name as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
    ));
  }
}

/// @nodoc
class _$_AuthProviderInfo implements _AuthProviderInfo {
  const _$_AuthProviderInfo(
      {@required this.accessToken, this.name, this.photoUrl})
      : assert(accessToken != null);

  @override
  final String accessToken;
  @override
  final String name;
  @override
  final String photoUrl;

  @override
  String toString() {
    return 'AuthProviderInfo(accessToken: $accessToken, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthProviderInfo &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
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
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrl);

  @override
  _$AuthProviderInfoCopyWith<_AuthProviderInfo> get copyWith =>
      __$AuthProviderInfoCopyWithImpl<_AuthProviderInfo>(this, _$identity);
}

abstract class _AuthProviderInfo implements AuthProviderInfo {
  const factory _AuthProviderInfo(
      {@required String accessToken,
      String name,
      String photoUrl}) = _$_AuthProviderInfo;

  @override
  String get accessToken;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  _$AuthProviderInfoCopyWith<_AuthProviderInfo> get copyWith;
}
