import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/utils/other_utils.dart';

part 'navigation_cubit.freezed.dart';
part 'navigation_state.dart';

/// Navigation stack management
class NavigationCubit extends Cubit<NavigationState> {
  /// Constructor
  NavigationCubit(this._authCubit) : super(NavigationState.initial()) {
    _sub = _authCubit.listen((authState) {
      emit(state.copyWith(authState: authState));
    });
  }

  final AuthCubit _authCubit;
  StreamSubscription _sub;

  void viewOwnProfile() {
    emit(state.copyWith(viewingProfile: userFromState(state.authState)));
  }

  void closeProfile() {
    emit(state.copyWith(viewingProfile: null));
  }

  void closeUpdatingScreen() {
    _authCubit.logout();
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
