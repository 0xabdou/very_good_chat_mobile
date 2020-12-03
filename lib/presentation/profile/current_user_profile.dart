import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/presentation/profile/profile.dart';
import 'package:very_good_chat/shared/injection.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/router.gr.dart';
import 'package:very_good_chat/shared/utils/other_utils.dart';

/// Profile screen duh
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthCubit authCubit;
  FriendCubit friendCubit;
  ProfileCubit profileCubit;

  @override
  void initState() {
    authCubit = context.read();
    friendCubit = context.read();
    profileCubit = ProfileCubit(
      authCubit: authCubit,
      friendCubit: friendCubit,
    );
    final user = userFromState(authCubit.state);
    if (user != null) {
      profileCubit.init(user);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      cubit: authCubit,
      listener: (context, state) {
        state.maybeMap(
          loggedIn: (li) => profileCubit.init(li.user),
          orElse: () {},
        );
      },
      builder: (context, state) {
        final user = userFromState(state);
        if (user == null) {
          logger.w('Building profile screen without a logged in user');
          return Container();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(user.name ?? user.username),
            actions: [
              IconButton(
                onPressed: () {
                  ExtendedNavigator.root.push(
                    Routes.updatingScreen,
                    arguments: UpdatingScreenArguments(
                      cubit: getIt()..updating(user),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          body: BlocProvider<ProfileCubit>(
            create: (_) => profileCubit,
            child: Profile(),
          ),
        );
      },
    );
  }
}
