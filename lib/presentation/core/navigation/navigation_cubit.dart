import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/presentation/core/navigation/app_pages.dart';
import 'package:very_good_chat/shared/utils/other_utils.dart';

/// Navigation stack management
class NavigationCubit extends Cubit<List<Page>> {
  /// Constructor
  NavigationCubit(this._authCubit) : super([AppPages.splashScreen()]) {
    _sub = _authCubit.listen(_authStateChanged);
  }

  final AuthCubit _authCubit;
  StreamSubscription _sub;

  @override
  List<Page> get state => List.of(super.state);

  void _authStateChanged(AuthState authState) {
    final pages = authState.map(
      initial: (_) => [AppPages.splashScreen()],
      loggedIn: (_) => [AppPages.loggedInScreen()],
      registering: (r) => [
        AppPages.loginScreen(),
        AppPages.registrationScreen(r.authInfo),
      ],
      loggedOut: (_) => [AppPages.loginScreen()],
    );
    emit(pages);
  }

  void viewOwnProfile() {
    final currentUser = userFromState(_authCubit.state);
    emit(state..add(AppPages.profileScreen(currentUser)));
  }

  void viewOtherProfile(User user) {
    emit(state..add(AppPages.profileScreen(user)));
  }

  void editProfile() {
    final currentUser = userFromState(_authCubit.state);
    emit(state..add(AppPages.profileEditingScreen(currentUser)));
  }

  void viewFullPicture({@required String photoUrl, String heroTag}) {
    emit(state
      ..add(AppPages.fullPhotoScreen(photoUrl: photoUrl, heroTag: heroTag)));
  }

  void openFriendRequestsScreen() {
    emit(state..add(AppPages.freindRequestsScreen()));
  }

  void pop() {
    final currentPage = state.last;
    if (currentPage.key == AppKeys.registrationScreen) {
      _authCubit.state.maybeMap(
        registering: (_) {
          _authCubit.logout();
        },
        orElse: () {
          emit(state..removeLast());
        },
      );
    } else
      emit(state..removeLast());
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
