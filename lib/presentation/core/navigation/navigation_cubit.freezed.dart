// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NavigationStateTearOff {
  const _$NavigationStateTearOff();

// ignore: unused_element
  _NavigationState call(
      {@required AuthState authState,
      bool editingProfile = false,
      User viewingProfile,
      bool viewingProfilePicture}) {
    return _NavigationState(
      authState: authState,
      editingProfile: editingProfile,
      viewingProfile: viewingProfile,
      viewingProfilePicture: viewingProfilePicture,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NavigationState = _$NavigationStateTearOff();

/// @nodoc
mixin _$NavigationState {
  AuthState get authState;
  bool get editingProfile;
  User get viewingProfile;
  bool get viewingProfilePicture;

  $NavigationStateCopyWith<NavigationState> get copyWith;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
  $Res call(
      {AuthState authState,
      bool editingProfile,
      User viewingProfile,
      bool viewingProfilePicture});

  $AuthStateCopyWith<$Res> get authState;
  $UserCopyWith<$Res> get viewingProfile;
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;

  @override
  $Res call({
    Object authState = freezed,
    Object editingProfile = freezed,
    Object viewingProfile = freezed,
    Object viewingProfilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      authState:
          authState == freezed ? _value.authState : authState as AuthState,
      editingProfile: editingProfile == freezed
          ? _value.editingProfile
          : editingProfile as bool,
      viewingProfile: viewingProfile == freezed
          ? _value.viewingProfile
          : viewingProfile as User,
      viewingProfilePicture: viewingProfilePicture == freezed
          ? _value.viewingProfilePicture
          : viewingProfilePicture as bool,
    ));
  }

  @override
  $AuthStateCopyWith<$Res> get authState {
    if (_value.authState == null) {
      return null;
    }
    return $AuthStateCopyWith<$Res>(_value.authState, (value) {
      return _then(_value.copyWith(authState: value));
    });
  }

  @override
  $UserCopyWith<$Res> get viewingProfile {
    if (_value.viewingProfile == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.viewingProfile, (value) {
      return _then(_value.copyWith(viewingProfile: value));
    });
  }
}

/// @nodoc
abstract class _$NavigationStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigationStateCopyWith(
          _NavigationState value, $Res Function(_NavigationState) then) =
      __$NavigationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthState authState,
      bool editingProfile,
      User viewingProfile,
      bool viewingProfilePicture});

  @override
  $AuthStateCopyWith<$Res> get authState;
  @override
  $UserCopyWith<$Res> get viewingProfile;
}

/// @nodoc
class __$NavigationStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res>
    implements _$NavigationStateCopyWith<$Res> {
  __$NavigationStateCopyWithImpl(
      _NavigationState _value, $Res Function(_NavigationState) _then)
      : super(_value, (v) => _then(v as _NavigationState));

  @override
  _NavigationState get _value => super._value as _NavigationState;

  @override
  $Res call({
    Object authState = freezed,
    Object editingProfile = freezed,
    Object viewingProfile = freezed,
    Object viewingProfilePicture = freezed,
  }) {
    return _then(_NavigationState(
      authState:
          authState == freezed ? _value.authState : authState as AuthState,
      editingProfile: editingProfile == freezed
          ? _value.editingProfile
          : editingProfile as bool,
      viewingProfile: viewingProfile == freezed
          ? _value.viewingProfile
          : viewingProfile as User,
      viewingProfilePicture: viewingProfilePicture == freezed
          ? _value.viewingProfilePicture
          : viewingProfilePicture as bool,
    ));
  }
}

/// @nodoc
class _$_NavigationState implements _NavigationState {
  const _$_NavigationState(
      {@required this.authState,
      this.editingProfile = false,
      this.viewingProfile,
      this.viewingProfilePicture})
      : assert(authState != null),
        assert(editingProfile != null);

  @override
  final AuthState authState;
  @JsonKey(defaultValue: false)
  @override
  final bool editingProfile;
  @override
  final User viewingProfile;
  @override
  final bool viewingProfilePicture;

  @override
  String toString() {
    return 'NavigationState(authState: $authState, editingProfile: $editingProfile, viewingProfile: $viewingProfile, viewingProfilePicture: $viewingProfilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NavigationState &&
            (identical(other.authState, authState) ||
                const DeepCollectionEquality()
                    .equals(other.authState, authState)) &&
            (identical(other.editingProfile, editingProfile) ||
                const DeepCollectionEquality()
                    .equals(other.editingProfile, editingProfile)) &&
            (identical(other.viewingProfile, viewingProfile) ||
                const DeepCollectionEquality()
                    .equals(other.viewingProfile, viewingProfile)) &&
            (identical(other.viewingProfilePicture, viewingProfilePicture) ||
                const DeepCollectionEquality().equals(
                    other.viewingProfilePicture, viewingProfilePicture)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authState) ^
      const DeepCollectionEquality().hash(editingProfile) ^
      const DeepCollectionEquality().hash(viewingProfile) ^
      const DeepCollectionEquality().hash(viewingProfilePicture);

  @override
  _$NavigationStateCopyWith<_NavigationState> get copyWith =>
      __$NavigationStateCopyWithImpl<_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {@required AuthState authState,
      bool editingProfile,
      User viewingProfile,
      bool viewingProfilePicture}) = _$_NavigationState;

  @override
  AuthState get authState;
  @override
  bool get editingProfile;
  @override
  User get viewingProfile;
  @override
  bool get viewingProfilePicture;
  @override
  _$NavigationStateCopyWith<_NavigationState> get copyWith;
}
