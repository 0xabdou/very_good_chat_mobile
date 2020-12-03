// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'relationship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RelationshipTearOff {
  const _$RelationshipTearOff();

// ignore: unused_element
  _Self self() {
    return const _Self();
  }

// ignore: unused_element
  _Friend friend({@required bool isOnline, DateTime lastSeen}) {
    return _Friend(
      isOnline: isOnline,
      lastSeen: lastSeen,
    );
  }

// ignore: unused_element
  _ReqSent requestSent() {
    return const _ReqSent();
  }

// ignore: unused_element
  _ReqReceived requestReceived() {
    return const _ReqReceived();
  }

// ignore: unused_element
  _Blocked blocked() {
    return const _Blocked();
  }

// ignore: unused_element
  _Stranger stranger() {
    return const _Stranger();
  }
}

/// @nodoc
// ignore: unused_element
const $Relationship = _$RelationshipTearOff();

/// @nodoc
mixin _$Relationship {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult self(),
    @required TResult friend(bool isOnline, DateTime lastSeen),
    @required TResult requestSent(),
    @required TResult requestReceived(),
    @required TResult blocked(),
    @required TResult stranger(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult self(),
    TResult friend(bool isOnline, DateTime lastSeen),
    TResult requestSent(),
    TResult requestReceived(),
    TResult blocked(),
    TResult stranger(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult self(_Self value),
    @required TResult friend(_Friend value),
    @required TResult requestSent(_ReqSent value),
    @required TResult requestReceived(_ReqReceived value),
    @required TResult blocked(_Blocked value),
    @required TResult stranger(_Stranger value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult self(_Self value),
    TResult friend(_Friend value),
    TResult requestSent(_ReqSent value),
    TResult requestReceived(_ReqReceived value),
    TResult blocked(_Blocked value),
    TResult stranger(_Stranger value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RelationshipCopyWith<$Res> {
  factory $RelationshipCopyWith(
          Relationship value, $Res Function(Relationship) then) =
      _$RelationshipCopyWithImpl<$Res>;
}

/// @nodoc
class _$RelationshipCopyWithImpl<$Res> implements $RelationshipCopyWith<$Res> {
  _$RelationshipCopyWithImpl(this._value, this._then);

  final Relationship _value;
  // ignore: unused_field
  final $Res Function(Relationship) _then;
}

/// @nodoc
abstract class _$SelfCopyWith<$Res> {
  factory _$SelfCopyWith(_Self value, $Res Function(_Self) then) =
      __$SelfCopyWithImpl<$Res>;
}

/// @nodoc
class __$SelfCopyWithImpl<$Res> extends _$RelationshipCopyWithImpl<$Res>
    implements _$SelfCopyWith<$Res> {
  __$SelfCopyWithImpl(_Self _value, $Res Function(_Self) _then)
      : super(_value, (v) => _then(v as _Self));

  @override
  _Self get _value => super._value as _Self;
}

/// @nodoc
class _$_Self with DiagnosticableTreeMixin implements _Self {
  const _$_Self();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Relationship.self()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Relationship.self'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Self);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult self(),
    @required TResult friend(bool isOnline, DateTime lastSeen),
    @required TResult requestSent(),
    @required TResult requestReceived(),
    @required TResult blocked(),
    @required TResult stranger(),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return self();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult self(),
    TResult friend(bool isOnline, DateTime lastSeen),
    TResult requestSent(),
    TResult requestReceived(),
    TResult blocked(),
    TResult stranger(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (self != null) {
      return self();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult self(_Self value),
    @required TResult friend(_Friend value),
    @required TResult requestSent(_ReqSent value),
    @required TResult requestReceived(_ReqReceived value),
    @required TResult blocked(_Blocked value),
    @required TResult stranger(_Stranger value),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return self(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult self(_Self value),
    TResult friend(_Friend value),
    TResult requestSent(_ReqSent value),
    TResult requestReceived(_ReqReceived value),
    TResult blocked(_Blocked value),
    TResult stranger(_Stranger value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (self != null) {
      return self(this);
    }
    return orElse();
  }
}

abstract class _Self implements Relationship {
  const factory _Self() = _$_Self;
}

/// @nodoc
abstract class _$FriendCopyWith<$Res> {
  factory _$FriendCopyWith(_Friend value, $Res Function(_Friend) then) =
      __$FriendCopyWithImpl<$Res>;
  $Res call({bool isOnline, DateTime lastSeen});
}

/// @nodoc
class __$FriendCopyWithImpl<$Res> extends _$RelationshipCopyWithImpl<$Res>
    implements _$FriendCopyWith<$Res> {
  __$FriendCopyWithImpl(_Friend _value, $Res Function(_Friend) _then)
      : super(_value, (v) => _then(v as _Friend));

  @override
  _Friend get _value => super._value as _Friend;

  @override
  $Res call({
    Object isOnline = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_Friend(
      isOnline: isOnline == freezed ? _value.isOnline : isOnline as bool,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as DateTime,
    ));
  }
}

/// @nodoc
class _$_Friend with DiagnosticableTreeMixin implements _Friend {
  const _$_Friend({@required this.isOnline, this.lastSeen})
      : assert(isOnline != null);

  @override
  final bool isOnline;
  @override
  final DateTime lastSeen;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Relationship.friend(isOnline: $isOnline, lastSeen: $lastSeen)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Relationship.friend'))
      ..add(DiagnosticsProperty('isOnline', isOnline))
      ..add(DiagnosticsProperty('lastSeen', lastSeen));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Friend &&
            (identical(other.isOnline, isOnline) ||
                const DeepCollectionEquality()
                    .equals(other.isOnline, isOnline)) &&
            (identical(other.lastSeen, lastSeen) ||
                const DeepCollectionEquality()
                    .equals(other.lastSeen, lastSeen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isOnline) ^
      const DeepCollectionEquality().hash(lastSeen);

  @override
  _$FriendCopyWith<_Friend> get copyWith =>
      __$FriendCopyWithImpl<_Friend>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult self(),
    @required TResult friend(bool isOnline, DateTime lastSeen),
    @required TResult requestSent(),
    @required TResult requestReceived(),
    @required TResult blocked(),
    @required TResult stranger(),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return friend(isOnline, lastSeen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult self(),
    TResult friend(bool isOnline, DateTime lastSeen),
    TResult requestSent(),
    TResult requestReceived(),
    TResult blocked(),
    TResult stranger(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (friend != null) {
      return friend(isOnline, lastSeen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult self(_Self value),
    @required TResult friend(_Friend value),
    @required TResult requestSent(_ReqSent value),
    @required TResult requestReceived(_ReqReceived value),
    @required TResult blocked(_Blocked value),
    @required TResult stranger(_Stranger value),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return friend(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult self(_Self value),
    TResult friend(_Friend value),
    TResult requestSent(_ReqSent value),
    TResult requestReceived(_ReqReceived value),
    TResult blocked(_Blocked value),
    TResult stranger(_Stranger value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (friend != null) {
      return friend(this);
    }
    return orElse();
  }
}

abstract class _Friend implements Relationship {
  const factory _Friend({@required bool isOnline, DateTime lastSeen}) =
      _$_Friend;

  bool get isOnline;
  DateTime get lastSeen;
  _$FriendCopyWith<_Friend> get copyWith;
}

/// @nodoc
abstract class _$ReqSentCopyWith<$Res> {
  factory _$ReqSentCopyWith(_ReqSent value, $Res Function(_ReqSent) then) =
      __$ReqSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$ReqSentCopyWithImpl<$Res> extends _$RelationshipCopyWithImpl<$Res>
    implements _$ReqSentCopyWith<$Res> {
  __$ReqSentCopyWithImpl(_ReqSent _value, $Res Function(_ReqSent) _then)
      : super(_value, (v) => _then(v as _ReqSent));

  @override
  _ReqSent get _value => super._value as _ReqSent;
}

/// @nodoc
class _$_ReqSent with DiagnosticableTreeMixin implements _ReqSent {
  const _$_ReqSent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Relationship.requestSent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Relationship.requestSent'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ReqSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult self(),
    @required TResult friend(bool isOnline, DateTime lastSeen),
    @required TResult requestSent(),
    @required TResult requestReceived(),
    @required TResult blocked(),
    @required TResult stranger(),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return requestSent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult self(),
    TResult friend(bool isOnline, DateTime lastSeen),
    TResult requestSent(),
    TResult requestReceived(),
    TResult blocked(),
    TResult stranger(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (requestSent != null) {
      return requestSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult self(_Self value),
    @required TResult friend(_Friend value),
    @required TResult requestSent(_ReqSent value),
    @required TResult requestReceived(_ReqReceived value),
    @required TResult blocked(_Blocked value),
    @required TResult stranger(_Stranger value),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return requestSent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult self(_Self value),
    TResult friend(_Friend value),
    TResult requestSent(_ReqSent value),
    TResult requestReceived(_ReqReceived value),
    TResult blocked(_Blocked value),
    TResult stranger(_Stranger value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (requestSent != null) {
      return requestSent(this);
    }
    return orElse();
  }
}

abstract class _ReqSent implements Relationship {
  const factory _ReqSent() = _$_ReqSent;
}

/// @nodoc
abstract class _$ReqReceivedCopyWith<$Res> {
  factory _$ReqReceivedCopyWith(
          _ReqReceived value, $Res Function(_ReqReceived) then) =
      __$ReqReceivedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ReqReceivedCopyWithImpl<$Res> extends _$RelationshipCopyWithImpl<$Res>
    implements _$ReqReceivedCopyWith<$Res> {
  __$ReqReceivedCopyWithImpl(
      _ReqReceived _value, $Res Function(_ReqReceived) _then)
      : super(_value, (v) => _then(v as _ReqReceived));

  @override
  _ReqReceived get _value => super._value as _ReqReceived;
}

/// @nodoc
class _$_ReqReceived with DiagnosticableTreeMixin implements _ReqReceived {
  const _$_ReqReceived();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Relationship.requestReceived()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Relationship.requestReceived'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ReqReceived);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult self(),
    @required TResult friend(bool isOnline, DateTime lastSeen),
    @required TResult requestSent(),
    @required TResult requestReceived(),
    @required TResult blocked(),
    @required TResult stranger(),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return requestReceived();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult self(),
    TResult friend(bool isOnline, DateTime lastSeen),
    TResult requestSent(),
    TResult requestReceived(),
    TResult blocked(),
    TResult stranger(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (requestReceived != null) {
      return requestReceived();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult self(_Self value),
    @required TResult friend(_Friend value),
    @required TResult requestSent(_ReqSent value),
    @required TResult requestReceived(_ReqReceived value),
    @required TResult blocked(_Blocked value),
    @required TResult stranger(_Stranger value),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return requestReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult self(_Self value),
    TResult friend(_Friend value),
    TResult requestSent(_ReqSent value),
    TResult requestReceived(_ReqReceived value),
    TResult blocked(_Blocked value),
    TResult stranger(_Stranger value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (requestReceived != null) {
      return requestReceived(this);
    }
    return orElse();
  }
}

abstract class _ReqReceived implements Relationship {
  const factory _ReqReceived() = _$_ReqReceived;
}

/// @nodoc
abstract class _$BlockedCopyWith<$Res> {
  factory _$BlockedCopyWith(_Blocked value, $Res Function(_Blocked) then) =
      __$BlockedCopyWithImpl<$Res>;
}

/// @nodoc
class __$BlockedCopyWithImpl<$Res> extends _$RelationshipCopyWithImpl<$Res>
    implements _$BlockedCopyWith<$Res> {
  __$BlockedCopyWithImpl(_Blocked _value, $Res Function(_Blocked) _then)
      : super(_value, (v) => _then(v as _Blocked));

  @override
  _Blocked get _value => super._value as _Blocked;
}

/// @nodoc
class _$_Blocked with DiagnosticableTreeMixin implements _Blocked {
  const _$_Blocked();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Relationship.blocked()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Relationship.blocked'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Blocked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult self(),
    @required TResult friend(bool isOnline, DateTime lastSeen),
    @required TResult requestSent(),
    @required TResult requestReceived(),
    @required TResult blocked(),
    @required TResult stranger(),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return blocked();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult self(),
    TResult friend(bool isOnline, DateTime lastSeen),
    TResult requestSent(),
    TResult requestReceived(),
    TResult blocked(),
    TResult stranger(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (blocked != null) {
      return blocked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult self(_Self value),
    @required TResult friend(_Friend value),
    @required TResult requestSent(_ReqSent value),
    @required TResult requestReceived(_ReqReceived value),
    @required TResult blocked(_Blocked value),
    @required TResult stranger(_Stranger value),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return blocked(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult self(_Self value),
    TResult friend(_Friend value),
    TResult requestSent(_ReqSent value),
    TResult requestReceived(_ReqReceived value),
    TResult blocked(_Blocked value),
    TResult stranger(_Stranger value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (blocked != null) {
      return blocked(this);
    }
    return orElse();
  }
}

abstract class _Blocked implements Relationship {
  const factory _Blocked() = _$_Blocked;
}

/// @nodoc
abstract class _$StrangerCopyWith<$Res> {
  factory _$StrangerCopyWith(_Stranger value, $Res Function(_Stranger) then) =
      __$StrangerCopyWithImpl<$Res>;
}

/// @nodoc
class __$StrangerCopyWithImpl<$Res> extends _$RelationshipCopyWithImpl<$Res>
    implements _$StrangerCopyWith<$Res> {
  __$StrangerCopyWithImpl(_Stranger _value, $Res Function(_Stranger) _then)
      : super(_value, (v) => _then(v as _Stranger));

  @override
  _Stranger get _value => super._value as _Stranger;
}

/// @nodoc
class _$_Stranger with DiagnosticableTreeMixin implements _Stranger {
  const _$_Stranger();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Relationship.stranger()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Relationship.stranger'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Stranger);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult self(),
    @required TResult friend(bool isOnline, DateTime lastSeen),
    @required TResult requestSent(),
    @required TResult requestReceived(),
    @required TResult blocked(),
    @required TResult stranger(),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return stranger();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult self(),
    TResult friend(bool isOnline, DateTime lastSeen),
    TResult requestSent(),
    TResult requestReceived(),
    TResult blocked(),
    TResult stranger(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (stranger != null) {
      return stranger();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult self(_Self value),
    @required TResult friend(_Friend value),
    @required TResult requestSent(_ReqSent value),
    @required TResult requestReceived(_ReqReceived value),
    @required TResult blocked(_Blocked value),
    @required TResult stranger(_Stranger value),
  }) {
    assert(self != null);
    assert(friend != null);
    assert(requestSent != null);
    assert(requestReceived != null);
    assert(blocked != null);
    assert(stranger != null);
    return stranger(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult self(_Self value),
    TResult friend(_Friend value),
    TResult requestSent(_ReqSent value),
    TResult requestReceived(_ReqReceived value),
    TResult blocked(_Blocked value),
    TResult stranger(_Stranger value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (stranger != null) {
      return stranger(this);
    }
    return orElse();
  }
}

abstract class _Stranger implements Relationship {
  const factory _Stranger() = _$_Stranger;
}
