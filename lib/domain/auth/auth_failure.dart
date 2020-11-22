import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// A sealed class representing failures that can happen during auth operations
@freezed
abstract class AuthFailure with _$AuthFailure {
  /// User canceled login
  const factory AuthFailure.canceledByUser() = _CanceledByUser;

  /// User is not registered
  const factory AuthFailure.notRegistered() = _NotRegistered;

  /// Local storage failure
  const factory AuthFailure.local() = _Local;

  /// Server failure
  const factory AuthFailure.server() = _Server;

  /// Network failure
  const factory AuthFailure.network() = _Network;
}
