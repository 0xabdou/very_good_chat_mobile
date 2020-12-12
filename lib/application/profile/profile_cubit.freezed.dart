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
      {@required bool initialized,
      User user,
      Relationship relationship,
      FriendOperation friendOperation = const FriendOperation.none()}) {
    return _ProfileState(
      initialized: initialized,
      user: user,
      relationship: relationship,
      friendOperation: friendOperation,
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
  FriendOperation get friendOperation;

  $ProfileStateCopyWith<ProfileState> get copyWith;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
  $Res call(
      {bool initialized,
      User user,
      Relationship relationship,
      FriendOperation friendOperation});

  $UserCopyWith<$Res> get user;
  $RelationshipCopyWith<$Res> get relationship;
  $FriendOperationCopyWith<$Res> get friendOperation;
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
    Object friendOperation = freezed,
  }) {
    return _then(_value.copyWith(
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
      user: user == freezed ? _value.user : user as User,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship as Relationship,
      friendOperation: friendOperation == freezed
          ? _value.friendOperation
          : friendOperation as FriendOperation,
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

  @override
  $FriendOperationCopyWith<$Res> get friendOperation {
    if (_value.friendOperation == null) {
      return null;
    }
    return $FriendOperationCopyWith<$Res>(_value.friendOperation, (value) {
      return _then(_value.copyWith(friendOperation: value));
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
  $Res call(
      {bool initialized,
      User user,
      Relationship relationship,
      FriendOperation friendOperation});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $RelationshipCopyWith<$Res> get relationship;
  @override
  $FriendOperationCopyWith<$Res> get friendOperation;
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
    Object friendOperation = freezed,
  }) {
    return _then(_ProfileState(
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
      user: user == freezed ? _value.user : user as User,
      relationship: relationship == freezed
          ? _value.relationship
          : relationship as Relationship,
      friendOperation: friendOperation == freezed
          ? _value.friendOperation
          : friendOperation as FriendOperation,
    ));
  }
}

/// @nodoc
class _$_ProfileState implements _ProfileState {
  const _$_ProfileState(
      {@required this.initialized,
      this.user,
      this.relationship,
      this.friendOperation = const FriendOperation.none()})
      : assert(initialized != null),
        assert(friendOperation != null);

  @override
  final bool initialized;
  @override
  final User user;
  @override
  final Relationship relationship;
  @JsonKey(defaultValue: const FriendOperation.none())
  @override
  final FriendOperation friendOperation;

  @override
  String toString() {
    return 'ProfileState(initialized: $initialized, user: $user, relationship: $relationship, friendOperation: $friendOperation)';
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
                    .equals(other.relationship, relationship)) &&
            (identical(other.friendOperation, friendOperation) ||
                const DeepCollectionEquality()
                    .equals(other.friendOperation, friendOperation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialized) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(relationship) ^
      const DeepCollectionEquality().hash(friendOperation);

  @override
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {@required bool initialized,
      User user,
      Relationship relationship,
      FriendOperation friendOperation}) = _$_ProfileState;

  @override
  bool get initialized;
  @override
  User get user;
  @override
  Relationship get relationship;
  @override
  FriendOperation get friendOperation;
  @override
  _$ProfileStateCopyWith<_ProfileState> get copyWith;
}

/// @nodoc
class _$FriendOperationTearOff {
  const _$FriendOperationTearOff();

// ignore: unused_element
  _None none() {
    return const _None();
  }

// ignore: unused_element
  _Some some() {
    return const _Some();
  }

// ignore: unused_element
  _Done done() {
    return const _Done();
  }

// ignore: unused_element
  _Fail fail(FriendFailure failure) {
    return _Fail(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FriendOperation = _$FriendOperationTearOff();

/// @nodoc
mixin _$FriendOperation {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult some(),
    @required TResult done(),
    @required TResult fail(FriendFailure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult some(),
    TResult done(),
    TResult fail(FriendFailure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(_None value),
    @required TResult some(_Some value),
    @required TResult done(_Done value),
    @required TResult fail(_Fail value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(_None value),
    TResult some(_Some value),
    TResult done(_Done value),
    TResult fail(_Fail value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $FriendOperationCopyWith<$Res> {
  factory $FriendOperationCopyWith(
          FriendOperation value, $Res Function(FriendOperation) then) =
      _$FriendOperationCopyWithImpl<$Res>;
}

/// @nodoc
class _$FriendOperationCopyWithImpl<$Res>
    implements $FriendOperationCopyWith<$Res> {
  _$FriendOperationCopyWithImpl(this._value, this._then);

  final FriendOperation _value;
  // ignore: unused_field
  final $Res Function(FriendOperation) _then;
}

/// @nodoc
abstract class _$NoneCopyWith<$Res> {
  factory _$NoneCopyWith(_None value, $Res Function(_None) then) =
      __$NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoneCopyWithImpl<$Res> extends _$FriendOperationCopyWithImpl<$Res>
    implements _$NoneCopyWith<$Res> {
  __$NoneCopyWithImpl(_None _value, $Res Function(_None) _then)
      : super(_value, (v) => _then(v as _None));

  @override
  _None get _value => super._value as _None;
}

/// @nodoc
class _$_None implements _None {
  const _$_None();

  @override
  String toString() {
    return 'FriendOperation.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult some(),
    @required TResult done(),
    @required TResult fail(FriendFailure failure),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult some(),
    TResult done(),
    TResult fail(FriendFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(_None value),
    @required TResult some(_Some value),
    @required TResult done(_Done value),
    @required TResult fail(_Fail value),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(_None value),
    TResult some(_Some value),
    TResult done(_Done value),
    TResult fail(_Fail value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _None implements FriendOperation {
  const factory _None() = _$_None;
}

/// @nodoc
abstract class _$SomeCopyWith<$Res> {
  factory _$SomeCopyWith(_Some value, $Res Function(_Some) then) =
      __$SomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$SomeCopyWithImpl<$Res> extends _$FriendOperationCopyWithImpl<$Res>
    implements _$SomeCopyWith<$Res> {
  __$SomeCopyWithImpl(_Some _value, $Res Function(_Some) _then)
      : super(_value, (v) => _then(v as _Some));

  @override
  _Some get _value => super._value as _Some;
}

/// @nodoc
class _$_Some implements _Some {
  const _$_Some();

  @override
  String toString() {
    return 'FriendOperation.some()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Some);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult some(),
    @required TResult done(),
    @required TResult fail(FriendFailure failure),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return some();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult some(),
    TResult done(),
    TResult fail(FriendFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (some != null) {
      return some();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(_None value),
    @required TResult some(_Some value),
    @required TResult done(_Done value),
    @required TResult fail(_Fail value),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return some(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(_None value),
    TResult some(_Some value),
    TResult done(_Done value),
    TResult fail(_Fail value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (some != null) {
      return some(this);
    }
    return orElse();
  }
}

abstract class _Some implements FriendOperation {
  const factory _Some() = _$_Some;
}

/// @nodoc
abstract class _$DoneCopyWith<$Res> {
  factory _$DoneCopyWith(_Done value, $Res Function(_Done) then) =
      __$DoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$DoneCopyWithImpl<$Res> extends _$FriendOperationCopyWithImpl<$Res>
    implements _$DoneCopyWith<$Res> {
  __$DoneCopyWithImpl(_Done _value, $Res Function(_Done) _then)
      : super(_value, (v) => _then(v as _Done));

  @override
  _Done get _value => super._value as _Done;
}

/// @nodoc
class _$_Done implements _Done {
  const _$_Done();

  @override
  String toString() {
    return 'FriendOperation.done()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Done);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult some(),
    @required TResult done(),
    @required TResult fail(FriendFailure failure),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return done();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult some(),
    TResult done(),
    TResult fail(FriendFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(_None value),
    @required TResult some(_Some value),
    @required TResult done(_Done value),
    @required TResult fail(_Fail value),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(_None value),
    TResult some(_Some value),
    TResult done(_Done value),
    TResult fail(_Fail value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _Done implements FriendOperation {
  const factory _Done() = _$_Done;
}

/// @nodoc
abstract class _$FailCopyWith<$Res> {
  factory _$FailCopyWith(_Fail value, $Res Function(_Fail) then) =
      __$FailCopyWithImpl<$Res>;
  $Res call({FriendFailure failure});

  $FriendFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$FailCopyWithImpl<$Res> extends _$FriendOperationCopyWithImpl<$Res>
    implements _$FailCopyWith<$Res> {
  __$FailCopyWithImpl(_Fail _value, $Res Function(_Fail) _then)
      : super(_value, (v) => _then(v as _Fail));

  @override
  _Fail get _value => super._value as _Fail;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_Fail(
      failure == freezed ? _value.failure : failure as FriendFailure,
    ));
  }

  @override
  $FriendFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $FriendFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_Fail implements _Fail {
  const _$_Fail(this.failure) : assert(failure != null);

  @override
  final FriendFailure failure;

  @override
  String toString() {
    return 'FriendOperation.fail(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Fail &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  _$FailCopyWith<_Fail> get copyWith =>
      __$FailCopyWithImpl<_Fail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult none(),
    @required TResult some(),
    @required TResult done(),
    @required TResult fail(FriendFailure failure),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return fail(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult none(),
    TResult some(),
    TResult done(),
    TResult fail(FriendFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fail != null) {
      return fail(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult none(_None value),
    @required TResult some(_Some value),
    @required TResult done(_Done value),
    @required TResult fail(_Fail value),
  }) {
    assert(none != null);
    assert(some != null);
    assert(done != null);
    assert(fail != null);
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult none(_None value),
    TResult some(_Some value),
    TResult done(_Done value),
    TResult fail(_Fail value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class _Fail implements FriendOperation {
  const factory _Fail(FriendFailure failure) = _$_Fail;

  FriendFailure get failure;
  _$FailCopyWith<_Fail> get copyWith;
}
