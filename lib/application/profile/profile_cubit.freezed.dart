// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProfileStateTearOff {
  const _$ProfileStateTearOff();

// ignore: unused_element
  _ProfileState call(
      {@required bool initialized, User user, Relationship relationship}) {
    return _ProfileState(
      initialized: initialized,
      user: user,
      relationship: relationship,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProfileState = _$ProfileStateTearOff();

/// @nodoc
mixin _$ProfileState {
  bool get initialized;
  User get user;
  Relationship get relationship;

  $ProfileStateCopyWith<ProfileState> get copyWith;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
  $Res call({bool initialized, User user, Relationship relationship});

  $UserCopyWith<$Res> get user;
  $RelationshipCopyWith<$Res> get relationship;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;

  @override
  $Res call({
    Object initialized = freezed,
    Object user = freezed,
    Object relationship = freezed,
  }) {
    return _then(_value.copyWith(
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
      user: user == freezed ? _value.user : user as User,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship as Relationship,
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

  @override
  $RelationshipCopyWith<$Res> get relationship {
    if (_value.relationship == null) {
      return null;
    }
    return $RelationshipCopyWith<$Res>(_value.relationship, (value) {
      return _then(_value.copyWith(relationship: value));
    });
  }
}

/// @nodoc
abstract class _$ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(
          _ProfileState value, $Res Function(_ProfileState) then) =
      __$ProfileStateCopyWithImpl<$Res>;
  @override
  $Res call({bool initialized, User user, Relationship relationship});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $RelationshipCopyWith<$Res> get relationship;
}

/// @nodoc
class __$ProfileStateCopyWithImpl<$Res> extends _$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(
      _ProfileState _value, $Res Function(_ProfileState) _then)
      : super(_value, (v) => _then(v as _ProfileState));

  @override
  _ProfileState get _value => super._value as _ProfileState;

  @override
  $Res call({
    Object initialized = freezed,
    Object user = freezed,
    Object relationship = freezed,
  }) {
    return _then(_ProfileState(
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
      user: user == freezed ? _value.user : user as User,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship as Relationship,
    ));
  }
}

/// @nodoc
class _$_ProfileState implements _ProfileState {
  const _$_ProfileState(
      {@required this.initialized, this.user, this.relationship})
      : assert(initialized != null);

  @override
  final bool initialized;
  @override
  final User user;
  @override
  final Relationship relationship;

  @override
  String toString() {
    return 'ProfileState(initialized: $initialized, user: $user, relationship: $relationship)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileState &&
            (identical(other.initialized, initialized) ||
                const DeepCollectionEquality()
                    .equals(other.initialized, initialized)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.relationship, relationship) ||
                const DeepCollectionEquality()
                    .equals(other.relationship, relationship)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialized) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(relationship);

  @override
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {@required bool initialized,
      User user,
      Relationship relationship}) = _$_ProfileState;

  @override
  bool get initialized;
  @override
  User get user;
  @override
  Relationship get relationship;
  @override
  _$ProfileStateCopyWith<_ProfileState> get copyWith;
}
