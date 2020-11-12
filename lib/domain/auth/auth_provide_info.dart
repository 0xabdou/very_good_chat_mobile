import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provide_info.freezed.dart';

@freezed
abstract class AuthProviderInfo with _$AuthProviderInfo {
  const factory AuthProviderInfo({
    @required String accessToken,
    String name,
    String photoUrl,
  }) = _AuthProviderInfo;
}
