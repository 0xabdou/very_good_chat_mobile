import 'package:auto_route/auto_route_annotations.dart';
import 'package:very_good_chat/presentation/auth/logged_in_screen.dart';
import 'package:very_good_chat/presentation/auth/login_screen.dart';
import 'package:very_good_chat/presentation/auth/splash_screen.dart';
import 'package:very_good_chat/presentation/auth/updating_screen.dart';
import 'package:very_good_chat/presentation/shared/image_cropper.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: UpdatingScreen),
    MaterialRoute(page: LoggedInScreen),
    MaterialRoute(page: ImageCropper),
  ],
)

/// Class used by AutoRoute code gen
class $AppRouter {}
