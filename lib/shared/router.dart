import 'package:auto_route/auto_route_annotations.dart';
import 'package:very_good_chat/presentation/auth/auth_screen.dart';
import 'package:very_good_chat/presentation/auth/login_screen.dart';
import 'package:very_good_chat/presentation/auth/registration_screen.dart';
import 'package:very_good_chat/presentation/core/image_cropper.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: AuthScreen, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: RegistrationScreen),
    MaterialRoute(page: ImageCropper),
  ],
)
class $AppRouter {}
