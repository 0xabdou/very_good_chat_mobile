// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoggedIn loggedIn(User user) {
    return _LoggedIn(
      user,
    );
  }

// ignore: unused_element
  _Registering registering(AuthProviderInfo authInfo) {
    return _Registering(
      authInfo,
    );
  }

// ignore: unused_element
  _LoggedOut loggedOut({bool loggingIn = false, AuthFailure failure}) {
    return _LoggedOut(
      loggingIn: loggingIn,
      failure: failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loggedIn(User user),
    @required TResult registering(AuthProviderInfo authInfo),
    @required TResult loggedOut(bool loggingIn, AuthFailure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loggedIn(User user),
    TResult registering(AuthProviderInfo authInfo),
    TResult loggedOut(bool loggingIn, AuthFailure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loggedIn(_LoggedIn value),
    @required TResult registering(_Registering value),
    @required TResult loggedOut(_LoggedOut value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loggedIn(_LoggedIn value),
    TResult registering(_Registering value),
    TResult loggedOut(_LoggedOut value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loggedIn(User user),
    @required TResult registering(AuthProviderInfo authInfo),
    @required TResult loggedOut(bool loggingIn, AuthFailure failure),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loggedIn(User user),
    TResult registering(AuthProviderInfo authInfo),
    TResult loggedOut(bool loggingIn, AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loggedIn(_LoggedIn value),
    @required TResult registering(_Registering value),
    @required TResult loggedOut(_LoggedOut value),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loggedIn(_LoggedIn value),
    TResult registering(_Registering value),
    TResult loggedOut(_LoggedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoggedInCopyWith<$Res> {
  factory _$LoggedInCopyWith(_LoggedIn value, $Res Function(_LoggedIn) then) =
      __$LoggedInCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$LoggedInCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoggedInCopyWith<$Res> {
  __$LoggedInCopyWithImpl(_LoggedIn _value, $Res Function(_LoggedIn) _then)
      : super(_value, (v) => _then(v as _LoggedIn));

  @override
  _LoggedIn get _value => super._value as _LoggedIn;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(_LoggedIn(
      user == freezed ? _value.user : user as User,
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
class _$_LoggedIn with DiagnosticableTreeMixin implements _LoggedIn {
  const _$_LoggedIn(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loggedIn(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loggedIn'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoggedIn &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  _$LoggedInCopyWith<_LoggedIn> get copyWith =>
      __$LoggedInCopyWithImpl<_LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loggedIn(User user),
    @required TResult registering(AuthProviderInfo authInfo),
    @required TResult loggedOut(bool loggingIn, AuthFailure failure),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loggedIn(User user),
    TResult registering(AuthProviderInfo authInfo),
    TResult loggedOut(bool loggingIn, AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loggedIn(_LoggedIn value),
    @required TResult registering(_Registering value),
    @required TResult loggedOut(_LoggedOut value),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loggedIn(_LoggedIn value),
    TResult registering(_Registering value),
    TResult loggedOut(_LoggedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedIn implements AuthState {
  const factory _LoggedIn(User user) = _$_LoggedIn;

  User get user;
  _$LoggedInCopyWith<_LoggedIn> get copyWith;
}

/// @nodoc
abstract class _$RegisteringCopyWith<$Res> {
  factory _$RegisteringCopyWith(
          _Registering value, $Res Function(_Registering) then) =
      __$RegisteringCopyWithImpl<$Res>;
  $Res call({AuthProviderInfo authInfo});

  $AuthProviderInfoCopyWith<$Res> get authInfo;
}

/// @nodoc
class __$RegisteringCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$RegisteringCopyWith<$Res> {
  __$RegisteringCopyWithImpl(
      _Registering _value, $Res Function(_Registering) _then)
      : super(_value, (v) => _then(v as _Registering));

  @override
  _Registering get _value => super._value as _Registering;

  @override
  $Res call({
    Object authInfo = freezed,
  }) {
    return _then(_Registering(
      authInfo == freezed ? _value.authInfo : authInfo as AuthProviderInfo,
    ));
  }

  @override
  $AuthProviderInfoCopyWith<$Res> get authInfo {
    if (_value.authInfo == null) {
      return null;
    }
    return $AuthProviderInfoCopyWith<$Res>(_value.authInfo, (value) {
      return _then(_value.copyWith(authInfo: value));
    });
  }
}

/// @nodoc
class _$_Registering with DiagnosticableTreeMixin implements _Registering {
  const _$_Registering(this.authInfo) : assert(authInfo != null);

  @override
  final AuthProviderInfo authInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.registering(authInfo: $authInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.registering'))
      ..add(DiagnosticsProperty('authInfo', authInfo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Registering &&
            (identical(other.authInfo, authInfo) ||
                const DeepCollectionEquality()
                    .equals(other.authInfo, authInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(authInfo);

  @override
  _$RegisteringCopyWith<_Registering> get copyWith =>
      __$RegisteringCopyWithImpl<_Registering>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loggedIn(User user),
    @required TResult registering(AuthProviderInfo authInfo),
    @required TResult loggedOut(bool loggingIn, AuthFailure failure),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return registering(authInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loggedIn(User user),
    TResult registering(AuthProviderInfo authInfo),
    TResult loggedOut(bool loggingIn, AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registering != null) {
      return registering(authInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loggedIn(_LoggedIn value),
    @required TResult registering(_Registering value),
    @required TResult loggedOut(_LoggedOut value),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return registering(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loggedIn(_LoggedIn value),
    TResult registering(_Registering value),
    TResult loggedOut(_LoggedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registering != null) {
      return registering(this);
    }
    return orElse();
  }
}

abstract class _Registering implements AuthState {
  const factory _Registering(AuthProviderInfo authInfo) = _$_Registering;

  AuthProviderInfo get authInfo;
  _$RegisteringCopyWith<_Registering> get copyWith;
}

/// @nodoc
abstract class _$LoggedOutCopyWith<$Res> {
  factory _$LoggedOutCopyWith(
          _LoggedOut value, $Res Function(_LoggedOut) then) =
      __$LoggedOutCopyWithImpl<$Res>;
  $Res call({bool loggingIn, AuthFailure failure});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoggedOutCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$LoggedOutCopyWith<$Res> {
  __$LoggedOutCopyWithImpl(_LoggedOut _value, $Res Function(_LoggedOut) _then)
      : super(_value, (v) => _then(v as _LoggedOut));

  @override
  _LoggedOut get _value => super._value as _LoggedOut;

  @override
  $Res call({
    Object loggingIn = freezed,
    Object failure = freezed,
  }) {
    return _then(_LoggedOut(
      loggingIn: loggingIn == freezed ? _value.loggingIn : loggingIn as bool,
      failure: failure == freezed ? _value.failure : failure as AuthFailure,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $AuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_LoggedOut with DiagnosticableTreeMixin implements _LoggedOut {
  const _$_LoggedOut({this.loggingIn = false, this.failure})
      : assert(loggingIn != null);

  @JsonKey(defaultValue: false)
  @override
  final bool loggingIn;
  @override
  final AuthFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loggedOut(loggingIn: $loggingIn, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.loggedOut'))
      ..add(DiagnosticsProperty('loggingIn', loggingIn))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoggedOut &&
            (identical(other.loggingIn, loggingIn) ||
                const DeepCollectionEquality()
                    .equals(other.loggingIn, loggingIn)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loggingIn) ^
      const DeepCollectionEquality().hash(failure);

  @override
  _$LoggedOutCopyWith<_LoggedOut> get copyWith =>
      __$LoggedOutCopyWithImpl<_LoggedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loggedIn(User user),
    @required TResult registering(AuthProviderInfo authInfo),
    @required TResult loggedOut(bool loggingIn, AuthFailure failure),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return loggedOut(loggingIn, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loggedIn(User user),
    TResult registering(AuthProviderInfo authInfo),
    TResult loggedOut(bool loggingIn, AuthFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut(loggingIn, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loggedIn(_LoggedIn value),
    @required TResult registering(_Registering value),
    @required TResult loggedOut(_LoggedOut value),
  }) {
    assert(initial != null);
    assert(loggedIn != null);
    assert(registering != null);
    assert(loggedOut != null);
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loggedIn(_LoggedIn value),
    TResult registering(_Registering value),
    TResult loggedOut(_LoggedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthState {
  const factory _LoggedOut({bool loggingIn, AuthFailure failure}) =
      _$_LoggedOut;

  bool get loggingIn;
  AuthFailure get failure;
  _$LoggedOutCopyWith<_LoggedOut> get copyWith;
}
