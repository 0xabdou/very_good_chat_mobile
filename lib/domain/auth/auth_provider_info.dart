import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provider_info.freezed.dart';

@freezed
abstract class AuthProviderInfo with _$AuthProviderInfo {
  const factory AuthProviderInfo({
    @required String accessToken,
    @required String name,
    @required String photoUrl,
  }) = _AuthProviderInfo;
}
