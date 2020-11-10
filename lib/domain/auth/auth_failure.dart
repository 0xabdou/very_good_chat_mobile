import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.canceledByUser() = _CanceledByUser;
  const factory AuthFailure.server() = _Server;
}