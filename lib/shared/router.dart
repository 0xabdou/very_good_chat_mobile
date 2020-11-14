import 'package:auto_route/auto_route_annotations.dart';
import 'package:very_good_chat/presentation/auth/logged_in_screen.dart';
import 'package:very_good_chat/presentation/auth/login_screen.dart';
import 'package:very_good_chat/presentation/auth/registration_screen.dart';
import 'package:very_good_chat/presentation/core/image_cropper.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // Should add as splash  screen later
    MaterialRoute(page: LoginScreen, initial: true),
    MaterialRoute(page: RegistrationScreen),
    MaterialRoute(page: LoggedInScreen),
    MaterialRoute(page: ImageCropper),
  ],
)
class $AppRouter {}
