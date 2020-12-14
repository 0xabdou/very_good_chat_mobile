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
      ViewingFullPhoto viewingProfilePicture,
      bool viewingFriendRequests = false}) {
    return _NavigationState(
      authState: authState,
      editingProfile: editingProfile,
      viewingProfile: viewingProfile,
      viewingProfilePicture: viewingProfilePicture,
      viewingFriendRequests: viewingFriendRequests,
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
  ViewingFullPhoto get viewingProfilePicture;
  bool get viewingFriendRequests;

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
      ViewingFullPhoto viewingProfilePicture,
      bool viewingFriendRequests});

  $AuthStateCopyWith<$Res> get authState;
  $UserCopyWith<$Res> get viewingProfile;
  $ViewingFullPhotoCopyWith<$Res> get viewingProfilePicture;
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
    Object viewingFriendRequests = freezed,
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
          : viewingProfilePicture as ViewingFullPhoto,
      viewingFriendRequests: viewingFriendRequests == freezed
          ? _value.viewingFriendRequests
          : viewingFriendRequests as bool,
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

  @override
  $ViewingFullPhotoCopyWith<$Res> get viewingProfilePicture {
    if (_value.viewingProfilePicture == null) {
      return null;
    }
    return $ViewingFullPhotoCopyWith<$Res>(_value.viewingProfilePicture,
        (value) {
      return _then(_value.copyWith(viewingProfilePicture: value));
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
      ViewingFullPhoto viewingProfilePicture,
      bool viewingFriendRequests});

  @override
  $AuthStateCopyWith<$Res> get authState;
  @override
  $UserCopyWith<$Res> get viewingProfile;
  @override
  $ViewingFullPhotoCopyWith<$Res> get viewingProfilePicture;
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
    Object viewingFriendRequests = freezed,
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
          : viewingProfilePicture as ViewingFullPhoto,
      viewingFriendRequests: viewingFriendRequests == freezed
          ? _value.viewingFriendRequests
          : viewingFriendRequests as bool,
    ));
  }
}

/// @nodoc
class _$_NavigationState implements _NavigationState {
  const _$_NavigationState(
      {@required this.authState,
      this.editingProfile = false,
      this.viewingProfile,
      this.viewingProfilePicture,
      this.viewingFriendRequests = false})
      : assert(authState != null),
        assert(editingProfile != null),
        assert(viewingFriendRequests != null);

  @override
  final AuthState authState;
  @JsonKey(defaultValue: false)
  @override
  final bool editingProfile;
  @override
  final User viewingProfile;
  @override
  final ViewingFullPhoto viewingProfilePicture;
  @JsonKey(defaultValue: false)
  @override
  final bool viewingFriendRequests;

  @override
  String toString() {
    return 'NavigationState(authState: $authState, editingProfile: $editingProfile, viewingProfile: $viewingProfile, viewingProfilePicture: $viewingProfilePicture, viewingFriendRequests: $viewingFriendRequests)';
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
                    other.viewingProfilePicture, viewingProfilePicture)) &&
            (identical(other.viewingFriendRequests, viewingFriendRequests) ||
                const DeepCollectionEquality().equals(
                    other.viewingFriendRequests, viewingFriendRequests)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authState) ^
      const DeepCollectionEquality().hash(editingProfile) ^
      const DeepCollectionEquality().hash(viewingProfile) ^
      const DeepCollectionEquality().hash(viewingProfilePicture) ^
      const DeepCollectionEquality().hash(viewingFriendRequests);

  @override
  _$NavigationStateCopyWith<_NavigationState> get copyWith =>
      __$NavigationStateCopyWithImpl<_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {@required AuthState authState,
      bool editingProfile,
      User viewingProfile,
      ViewingFullPhoto viewingProfilePicture,
      bool viewingFriendRequests}) = _$_NavigationState;

  @override
  AuthState get authState;
  @override
  bool get editingProfile;
  @override
  User get viewingProfile;
  @override
  ViewingFullPhoto get viewingProfilePicture;
  @override
  bool get viewingFriendRequests;
  @override
  _$NavigationStateCopyWith<_NavigationState> get copyWith;
}

/// @nodoc
class _$ViewingFullPhotoTearOff {
  const _$ViewingFullPhotoTearOff();

// ignore: unused_element
  _ViewingFullPhoto call({@required String photoUrl, String heroTag}) {
    return _ViewingFullPhoto(
      photoUrl: photoUrl,
      heroTag: heroTag,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ViewingFullPhoto = _$ViewingFullPhotoTearOff();

/// @nodoc
mixin _$ViewingFullPhoto {
  String get photoUrl;
  String get heroTag;

  $ViewingFullPhotoCopyWith<ViewingFullPhoto> get copyWith;
}

/// @nodoc
abstract class $ViewingFullPhotoCopyWith<$Res> {
  factory $ViewingFullPhotoCopyWith(
          ViewingFullPhoto value, $Res Function(ViewingFullPhoto) then) =
      _$ViewingFullPhotoCopyWithImpl<$Res>;
  $Res call({String photoUrl, String heroTag});
}

/// @nodoc
class _$ViewingFullPhotoCopyWithImpl<$Res>
    implements $ViewingFullPhotoCopyWith<$Res> {
  _$ViewingFullPhotoCopyWithImpl(this._value, this._then);

  final ViewingFullPhoto _value;
  // ignore: unused_field
  final $Res Function(ViewingFullPhoto) _then;

  @override
  $Res call({
    Object photoUrl = freezed,
    Object heroTag = freezed,
  }) {
    return _then(_value.copyWith(
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      heroTag: heroTag == freezed ? _value.heroTag : heroTag as String,
    ));
  }
}

/// @nodoc
abstract class _$ViewingFullPhotoCopyWith<$Res>
    implements $ViewingFullPhotoCopyWith<$Res> {
  factory _$ViewingFullPhotoCopyWith(
          _ViewingFullPhoto value, $Res Function(_ViewingFullPhoto) then) =
      __$ViewingFullPhotoCopyWithImpl<$Res>;
  @override
  $Res call({String photoUrl, String heroTag});
}

/// @nodoc
class __$ViewingFullPhotoCopyWithImpl<$Res>
    extends _$ViewingFullPhotoCopyWithImpl<$Res>
    implements _$ViewingFullPhotoCopyWith<$Res> {
  __$ViewingFullPhotoCopyWithImpl(
      _ViewingFullPhoto _value, $Res Function(_ViewingFullPhoto) _then)
      : super(_value, (v) => _then(v as _ViewingFullPhoto));

  @override
  _ViewingFullPhoto get _value => super._value as _ViewingFullPhoto;

  @override
  $Res call({
    Object photoUrl = freezed,
    Object heroTag = freezed,
  }) {
    return _then(_ViewingFullPhoto(
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      heroTag: heroTag == freezed ? _value.heroTag : heroTag as String,
    ));
  }
}

/// @nodoc
class _$_ViewingFullPhoto implements _ViewingFullPhoto {
  const _$_ViewingFullPhoto({@required this.photoUrl, this.heroTag})
      : assert(photoUrl != null);

  @override
  final String photoUrl;
  @override
  final String heroTag;

  @override
  String toString() {
    return 'ViewingFullPhoto(photoUrl: $photoUrl, heroTag: $heroTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViewingFullPhoto &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.heroTag, heroTag) ||
                const DeepCollectionEquality().equals(other.heroTag, heroTag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(heroTag);

  @override
  _$ViewingFullPhotoCopyWith<_ViewingFullPhoto> get copyWith =>
      __$ViewingFullPhotoCopyWithImpl<_ViewingFullPhoto>(this, _$identity);
}

abstract class _ViewingFullPhoto implements ViewingFullPhoto {
  const factory _ViewingFullPhoto({@required String photoUrl, String heroTag}) =
      _$_ViewingFullPhoto;

  @override
  String get photoUrl;
  @override
  String get heroTag;
  @override
  _$ViewingFullPhotoCopyWith<_ViewingFullPhoto> get copyWith;
}
