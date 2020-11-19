// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'registration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RegistrationStateTearOff {
  const _$RegistrationStateTearOff();

// ignore: unused_element
  _RegistrationState call(
      {@required String authProviderAccessToken,
      @required String username,
      @required String name,
      @required bool callingApi,
      @required bool done,
      Uint8List photoBytes,
      String photoUrl,
      AuthFailure apiFailure,
      String usernameError}) {
    return _RegistrationState(
      authProviderAccessToken: authProviderAccessToken,
      username: username,
      name: name,
      callingApi: callingApi,
      done: done,
      photoBytes: photoBytes,
      photoUrl: photoUrl,
      apiFailure: apiFailure,
      usernameError: usernameError,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RegistrationState = _$RegistrationStateTearOff();

/// @nodoc
mixin _$RegistrationState {
  String get authProviderAccessToken;
  String get username;
  String get name;
  bool get callingApi;
  bool get done;
  Uint8List get photoBytes;
  String get photoUrl;
  AuthFailure get apiFailure;
  String get usernameError;

  $RegistrationStateCopyWith<RegistrationState> get copyWith;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res>;
  $Res call(
      {String authProviderAccessToken,
      String username,
      String name,
      bool callingApi,
      bool done,
      Uint8List photoBytes,
      String photoUrl,
      AuthFailure apiFailure,
      String usernameError});

  $AuthFailureCopyWith<$Res> get apiFailure;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  final RegistrationState _value;
  // ignore: unused_field
  final $Res Function(RegistrationState) _then;

  @override
  $Res call({
    Object authProviderAccessToken = freezed,
    Object username = freezed,
    Object name = freezed,
    Object callingApi = freezed,
    Object done = freezed,
    Object photoBytes = freezed,
    Object photoUrl = freezed,
    Object apiFailure = freezed,
    Object usernameError = freezed,
  }) {
    return _then(_value.copyWith(
      authProviderAccessToken: authProviderAccessToken == freezed
          ? _value.authProviderAccessToken
          : authProviderAccessToken as String,
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
      callingApi:
          callingApi == freezed ? _value.callingApi : callingApi as bool,
      done: done == freezed ? _value.done : done as bool,
      photoBytes:
          photoBytes == freezed ? _value.photoBytes : photoBytes as Uint8List,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      apiFailure:
          apiFailure == freezed ? _value.apiFailure : apiFailure as AuthFailure,
      usernameError: usernameError == freezed
          ? _value.usernameError
          : usernameError as String,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res> get apiFailure {
    if (_value.apiFailure == null) {
      return null;
    }
    return $AuthFailureCopyWith<$Res>(_value.apiFailure, (value) {
      return _then(_value.copyWith(apiFailure: value));
    });
  }
}

/// @nodoc
abstract class _$RegistrationStateCopyWith<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  factory _$RegistrationStateCopyWith(
          _RegistrationState value, $Res Function(_RegistrationState) then) =
      __$RegistrationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String authProviderAccessToken,
      String username,
      String name,
      bool callingApi,
      bool done,
      Uint8List photoBytes,
      String photoUrl,
      AuthFailure apiFailure,
      String usernameError});

  @override
  $AuthFailureCopyWith<$Res> get apiFailure;
}

/// @nodoc
class __$RegistrationStateCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res>
    implements _$RegistrationStateCopyWith<$Res> {
  __$RegistrationStateCopyWithImpl(
      _RegistrationState _value, $Res Function(_RegistrationState) _then)
      : super(_value, (v) => _then(v as _RegistrationState));

  @override
  _RegistrationState get _value => super._value as _RegistrationState;

  @override
  $Res call({
    Object authProviderAccessToken = freezed,
    Object username = freezed,
    Object name = freezed,
    Object callingApi = freezed,
    Object done = freezed,
    Object photoBytes = freezed,
    Object photoUrl = freezed,
    Object apiFailure = freezed,
    Object usernameError = freezed,
  }) {
    return _then(_RegistrationState(
      authProviderAccessToken: authProviderAccessToken == freezed
          ? _value.authProviderAccessToken
          : authProviderAccessToken as String,
      username: username == freezed ? _value.username : username as String,
      name: name == freezed ? _value.name : name as String,
      callingApi:
          callingApi == freezed ? _value.callingApi : callingApi as bool,
      done: done == freezed ? _value.done : done as bool,
      photoBytes:
          photoBytes == freezed ? _value.photoBytes : photoBytes as Uint8List,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      apiFailure:
          apiFailure == freezed ? _value.apiFailure : apiFailure as AuthFailure,
      usernameError: usernameError == freezed
          ? _value.usernameError
          : usernameError as String,
    ));
  }
}

/// @nodoc
class _$_RegistrationState
    with DiagnosticableTreeMixin
    implements _RegistrationState {
  const _$_RegistrationState(
      {@required this.authProviderAccessToken,
      @required this.username,
      @required this.name,
      @required this.callingApi,
      @required this.done,
      this.photoBytes,
      this.photoUrl,
      this.apiFailure,
      this.usernameError})
      : assert(authProviderAccessToken != null),
        assert(username != null),
        assert(name != null),
        assert(callingApi != null),
        assert(done != null);

  @override
  final String authProviderAccessToken;
  @override
  final String username;
  @override
  final String name;
  @override
  final bool callingApi;
  @override
  final bool done;
  @override
  final Uint8List photoBytes;
  @override
  final String photoUrl;
  @override
  final AuthFailure apiFailure;
  @override
  final String usernameError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegistrationState(authProviderAccessToken: $authProviderAccessToken, username: $username, name: $name, callingApi: $callingApi, done: $done, photoBytes: $photoBytes, photoUrl: $photoUrl, apiFailure: $apiFailure, usernameError: $usernameError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegistrationState'))
      ..add(DiagnosticsProperty(
          'authProviderAccessToken', authProviderAccessToken))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('callingApi', callingApi))
      ..add(DiagnosticsProperty('done', done))
      ..add(DiagnosticsProperty('photoBytes', photoBytes))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('apiFailure', apiFailure))
      ..add(DiagnosticsProperty('usernameError', usernameError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationState &&
            (identical(
                    other.authProviderAccessToken, authProviderAccessToken) ||
                const DeepCollectionEquality().equals(
                    other.authProviderAccessToken, authProviderAccessToken)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.callingApi, callingApi) ||
                const DeepCollectionEquality()
                    .equals(other.callingApi, callingApi)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)) &&
            (identical(other.photoBytes, photoBytes) ||
                const DeepCollectionEquality()
                    .equals(other.photoBytes, photoBytes)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.apiFailure, apiFailure) ||
                const DeepCollectionEquality()
                    .equals(other.apiFailure, apiFailure)) &&
            (identical(other.usernameError, usernameError) ||
                const DeepCollectionEquality()
                    .equals(other.usernameError, usernameError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authProviderAccessToken) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(callingApi) ^
      const DeepCollectionEquality().hash(done) ^
      const DeepCollectionEquality().hash(photoBytes) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(apiFailure) ^
      const DeepCollectionEquality().hash(usernameError);

  @override
  _$RegistrationStateCopyWith<_RegistrationState> get copyWith =>
      __$RegistrationStateCopyWithImpl<_RegistrationState>(this, _$identity);
}

abstract class _RegistrationState implements RegistrationState {
  const factory _RegistrationState(
      {@required String authProviderAccessToken,
      @required String username,
      @required String name,
      @required bool callingApi,
      @required bool done,
      Uint8List photoBytes,
      String photoUrl,
      AuthFailure apiFailure,
      String usernameError}) = _$_RegistrationState;

  @override
  String get authProviderAccessToken;
  @override
  String get username;
  @override
  String get name;
  @override
  bool get callingApi;
  @override
  bool get done;
  @override
  Uint8List get photoBytes;
  @override
  String get photoUrl;
  @override
  AuthFailure get apiFailure;
  @override
  String get usernameError;
  @override
  _$RegistrationStateCopyWith<_RegistrationState> get copyWith;
}
