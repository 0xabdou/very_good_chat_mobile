// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_updates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserUpdatesTearOff {
  const _$UserUpdatesTearOff();

// ignore: unused_element
  _UserUpdates call({@required String username, @required String name}) {
    return _UserUpdates(
      username: username,
      name: name,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserUpdates = _$UserUpdatesTearOff();

/// @nodoc
mixin _$UserUpdates {
  String get username;
  String get name;

  $UserUpdatesCopyWith<UserUpdates> get copyWith;
}

/// @nodoc
abstract class $UserUpdatesCopyWith<$Res> {
  factory $UserUpdatesCopyWith(
          UserUpdates value, $Res Function(UserUpdates) then) =
      _$UserUpdatesCopyWithImpl<$Res>;
  $Res call({String username, String name});
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
  $Res call({String username, String name});
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

/// @nodoc
class _$_UserUpdates implements _UserUpdates {
  const _$_UserUpdates({@required this.username, @required this.name})
      : assert(username != null),
        assert(name != null);

  @override
  final String username;
  @override
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
}

abstract class _UserUpdates implements UserUpdates {
  const factory _UserUpdates(
      {@required String username, @required String name}) = _$_UserUpdates;

  @override
  String get username;
  @override
  String get name;
  @override
  _$UserUpdatesCopyWith<_UserUpdates> get copyWith;
}
