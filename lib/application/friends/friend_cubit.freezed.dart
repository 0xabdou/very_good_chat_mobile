// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'friend_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FriendStateTearOff {
  const _$FriendStateTearOff();

// ignore: unused_element
  _FriendState call(
      {List<Friend> allFriends = const [],
      List<Friend> onlineFriends = const [],
      List<Friend> offlineFriends = const [],
      List<FriendRequest> allRequests = const [],
      List<FriendRequest> sentRequests = const [],
      List<FriendRequest> receivedRequests = const [],
      List<String> requestsBeingTreated = const [],
      FriendFailure failure}) {
    return _FriendState(
      allFriends: allFriends,
      onlineFriends: onlineFriends,
      offlineFriends: offlineFriends,
      allRequests: allRequests,
      sentRequests: sentRequests,
      receivedRequests: receivedRequests,
      requestsBeingTreated: requestsBeingTreated,
      failure: failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FriendState = _$FriendStateTearOff();

/// @nodoc
mixin _$FriendState {
  List<Friend> get allFriends;
  List<Friend> get onlineFriends;
  List<Friend> get offlineFriends;
  List<FriendRequest> get allRequests;
  List<FriendRequest> get sentRequests;
  List<FriendRequest>
      get receivedRequests; // List of user ids of requests currently being treated
// (being canceled, accepted, or rejected)
  List<String> get requestsBeingTreated;
  FriendFailure get failure;

  $FriendStateCopyWith<FriendState> get copyWith;
}

/// @nodoc
abstract class $FriendStateCopyWith<$Res> {
  factory $FriendStateCopyWith(
          FriendState value, $Res Function(FriendState) then) =
      _$FriendStateCopyWithImpl<$Res>;
  $Res call(
      {List<Friend> allFriends,
      List<Friend> onlineFriends,
      List<Friend> offlineFriends,
      List<FriendRequest> allRequests,
      List<FriendRequest> sentRequests,
      List<FriendRequest> receivedRequests,
      List<String> requestsBeingTreated,
      FriendFailure failure});

  $FriendFailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$FriendStateCopyWithImpl<$Res> implements $FriendStateCopyWith<$Res> {
  _$FriendStateCopyWithImpl(this._value, this._then);

  final FriendState _value;
  // ignore: unused_field
  final $Res Function(FriendState) _then;

  @override
  $Res call({
    Object allFriends = freezed,
    Object onlineFriends = freezed,
    Object offlineFriends = freezed,
    Object allRequests = freezed,
    Object sentRequests = freezed,
    Object receivedRequests = freezed,
    Object requestsBeingTreated = freezed,
    Object failure = freezed,
  }) {
    return _then(_value.copyWith(
      allFriends: allFriends == freezed
          ? _value.allFriends
          : allFriends as List<Friend>,
      onlineFriends: onlineFriends == freezed
          ? _value.onlineFriends
          : onlineFriends as List<Friend>,
      offlineFriends: offlineFriends == freezed
          ? _value.offlineFriends
          : offlineFriends as List<Friend>,
      allRequests: allRequests == freezed
          ? _value.allRequests
          : allRequests as List<FriendRequest>,
      sentRequests: sentRequests == freezed
          ? _value.sentRequests
          : sentRequests as List<FriendRequest>,
      receivedRequests: receivedRequests == freezed
          ? _value.receivedRequests
          : receivedRequests as List<FriendRequest>,
      requestsBeingTreated: requestsBeingTreated == freezed
          ? _value.requestsBeingTreated
          : requestsBeingTreated as List<String>,
      failure: failure == freezed ? _value.failure : failure as FriendFailure,
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
abstract class _$FriendStateCopyWith<$Res>
    implements $FriendStateCopyWith<$Res> {
  factory _$FriendStateCopyWith(
          _FriendState value, $Res Function(_FriendState) then) =
      __$FriendStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Friend> allFriends,
      List<Friend> onlineFriends,
      List<Friend> offlineFriends,
      List<FriendRequest> allRequests,
      List<FriendRequest> sentRequests,
      List<FriendRequest> receivedRequests,
      List<String> requestsBeingTreated,
      FriendFailure failure});

  @override
  $FriendFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$FriendStateCopyWithImpl<$Res> extends _$FriendStateCopyWithImpl<$Res>
    implements _$FriendStateCopyWith<$Res> {
  __$FriendStateCopyWithImpl(
      _FriendState _value, $Res Function(_FriendState) _then)
      : super(_value, (v) => _then(v as _FriendState));

  @override
  _FriendState get _value => super._value as _FriendState;

  @override
  $Res call({
    Object allFriends = freezed,
    Object onlineFriends = freezed,
    Object offlineFriends = freezed,
    Object allRequests = freezed,
    Object sentRequests = freezed,
    Object receivedRequests = freezed,
    Object requestsBeingTreated = freezed,
    Object failure = freezed,
  }) {
    return _then(_FriendState(
      allFriends: allFriends == freezed
          ? _value.allFriends
          : allFriends as List<Friend>,
      onlineFriends: onlineFriends == freezed
          ? _value.onlineFriends
          : onlineFriends as List<Friend>,
      offlineFriends: offlineFriends == freezed
          ? _value.offlineFriends
          : offlineFriends as List<Friend>,
      allRequests: allRequests == freezed
          ? _value.allRequests
          : allRequests as List<FriendRequest>,
      sentRequests: sentRequests == freezed
          ? _value.sentRequests
          : sentRequests as List<FriendRequest>,
      receivedRequests: receivedRequests == freezed
          ? _value.receivedRequests
          : receivedRequests as List<FriendRequest>,
      requestsBeingTreated: requestsBeingTreated == freezed
          ? _value.requestsBeingTreated
          : requestsBeingTreated as List<String>,
      failure: failure == freezed ? _value.failure : failure as FriendFailure,
    ));
  }
}

/// @nodoc
class _$_FriendState with DiagnosticableTreeMixin implements _FriendState {
  const _$_FriendState(
      {this.allFriends = const [],
      this.onlineFriends = const [],
      this.offlineFriends = const [],
      this.allRequests = const [],
      this.sentRequests = const [],
      this.receivedRequests = const [],
      this.requestsBeingTreated = const [],
      this.failure})
      : assert(allFriends != null),
        assert(onlineFriends != null),
        assert(offlineFriends != null),
        assert(allRequests != null),
        assert(sentRequests != null),
        assert(receivedRequests != null),
        assert(requestsBeingTreated != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Friend> allFriends;
  @JsonKey(defaultValue: const [])
  @override
  final List<Friend> onlineFriends;
  @JsonKey(defaultValue: const [])
  @override
  final List<Friend> offlineFriends;
  @JsonKey(defaultValue: const [])
  @override
  final List<FriendRequest> allRequests;
  @JsonKey(defaultValue: const [])
  @override
  final List<FriendRequest> sentRequests;
  @JsonKey(defaultValue: const [])
  @override
  final List<FriendRequest> receivedRequests;
  @JsonKey(defaultValue: const [])
  @override // List of user ids of requests currently being treated
// (being canceled, accepted, or rejected)
  final List<String> requestsBeingTreated;
  @override
  final FriendFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FriendState(allFriends: $allFriends, onlineFriends: $onlineFriends, offlineFriends: $offlineFriends, allRequests: $allRequests, sentRequests: $sentRequests, receivedRequests: $receivedRequests, requestsBeingTreated: $requestsBeingTreated, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FriendState'))
      ..add(DiagnosticsProperty('allFriends', allFriends))
      ..add(DiagnosticsProperty('onlineFriends', onlineFriends))
      ..add(DiagnosticsProperty('offlineFriends', offlineFriends))
      ..add(DiagnosticsProperty('allRequests', allRequests))
      ..add(DiagnosticsProperty('sentRequests', sentRequests))
      ..add(DiagnosticsProperty('receivedRequests', receivedRequests))
      ..add(DiagnosticsProperty('requestsBeingTreated', requestsBeingTreated))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FriendState &&
            (identical(other.allFriends, allFriends) ||
                const DeepCollectionEquality()
                    .equals(other.allFriends, allFriends)) &&
            (identical(other.onlineFriends, onlineFriends) ||
                const DeepCollectionEquality()
                    .equals(other.onlineFriends, onlineFriends)) &&
            (identical(other.offlineFriends, offlineFriends) ||
                const DeepCollectionEquality()
                    .equals(other.offlineFriends, offlineFriends)) &&
            (identical(other.allRequests, allRequests) ||
                const DeepCollectionEquality()
                    .equals(other.allRequests, allRequests)) &&
            (identical(other.sentRequests, sentRequests) ||
                const DeepCollectionEquality()
                    .equals(other.sentRequests, sentRequests)) &&
            (identical(other.receivedRequests, receivedRequests) ||
                const DeepCollectionEquality()
                    .equals(other.receivedRequests, receivedRequests)) &&
            (identical(other.requestsBeingTreated, requestsBeingTreated) ||
                const DeepCollectionEquality().equals(
                    other.requestsBeingTreated, requestsBeingTreated)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(allFriends) ^
      const DeepCollectionEquality().hash(onlineFriends) ^
      const DeepCollectionEquality().hash(offlineFriends) ^
      const DeepCollectionEquality().hash(allRequests) ^
      const DeepCollectionEquality().hash(sentRequests) ^
      const DeepCollectionEquality().hash(receivedRequests) ^
      const DeepCollectionEquality().hash(requestsBeingTreated) ^
      const DeepCollectionEquality().hash(failure);

  @override
  _$FriendStateCopyWith<_FriendState> get copyWith =>
      __$FriendStateCopyWithImpl<_FriendState>(this, _$identity);
}

abstract class _FriendState implements FriendState {
  const factory _FriendState(
      {List<Friend> allFriends,
      List<Friend> onlineFriends,
      List<Friend> offlineFriends,
      List<FriendRequest> allRequests,
      List<FriendRequest> sentRequests,
      List<FriendRequest> receivedRequests,
      List<String> requestsBeingTreated,
      FriendFailure failure}) = _$_FriendState;

  @override
  List<Friend> get allFriends;
  @override
  List<Friend> get onlineFriends;
  @override
  List<Friend> get offlineFriends;
  @override
  List<FriendRequest> get allRequests;
  @override
  List<FriendRequest> get sentRequests;
  @override
  List<FriendRequest> get receivedRequests;
  @override // List of user ids of requests currently being treated
// (being canceled, accepted, or rejected)
  List<String> get requestsBeingTreated;
  @override
  FriendFailure get failure;
  @override
  _$FriendStateCopyWith<_FriendState> get copyWith;
}
