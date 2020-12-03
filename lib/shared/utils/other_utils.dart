import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/domain/auth/user.dart';

/// if [state] is [AuthState.loggedIn], returns the logged in [User]
/// else returns null
User userFromState(AuthState state) {
  return state.maybeMap(
    loggedIn: (li) => li.user,
    orElse: () => null,
  );
}
