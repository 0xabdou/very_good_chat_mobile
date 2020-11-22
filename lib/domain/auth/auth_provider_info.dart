import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provider_info.freezed.dart';

/// A class that holds data provided by an authentication provider
@freezed
abstract class AuthProviderInfo with _$AuthProviderInfo {
  /// Constructor
  const factory AuthProviderInfo({
    @required String accessToken,
    String name,
    String photoUrl,
  }) = _AuthProviderInfo;
}
