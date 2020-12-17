import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/presentation/profile/profile.dart';
import 'package:very_good_chat/shared/injection.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/size_config.dart';
import 'package:very_good_chat/shared/utils/other_utils.dart';

/// Profile screen duh
class ProfileScreen extends StatefulWidget {
  /// Constructor
  const ProfileScreen({
    Key key,
    @required this.user,
  })  : assert(user != null),
        super(key: key);

  /// The user of this profile
  final User user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthCubit authCubit;
  FriendCubit friendCubit;
  ProfileCubit profileCubit;

  @override
  void initState() {
    // Debatable
    authCubit = context.read();
    friendCubit = context.read();
    profileCubit = ProfileCubit(
      authCubit: authCubit,
      friendCubit: friendCubit,
      friendRepository: getIt(),
    )..init(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      cubit: profileCubit,
      builder: (context, state) {
        return BlocProvider<ProfileCubit>(
          create: (_) => profileCubit,
          child: state.relationship.maybeMap(
            self: (_) => CurrentUserScaffold(),
            orElse: () => OtherUserScaffold(),
          ),
        );
      },
    );
  }
}

/// Current user scaffold
class CurrentUserScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          loggedIn: (li) => context.read<ProfileCubit>().init(li.user),
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
                  context.read<NavigationCubit>().editProfile();
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  //  TODO: go to settings page instead when you implement it
                  context.read<NavigationCubit>().viewBlockedUsersScreen();
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: Profile(),
        );
      },
    );
  }
}

/// Other user scaffold
class OtherUserScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();
    final user = profileCubit.state.user;
    final blocked = profileCubit.state.relationship.maybeMap(
      orElse: () => false,
      blocked: (_) => true,
    );
    final sc = SizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? user.username),
        actions: blocked
            ? null
            : [
                PopupMenuButton<_OtherUserActions>(
                  onSelected: (action) {
                    profileCubit.block(context);
                  },
                  offset: Offset(0, sc.height(6.2)),
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: _OtherUserActions.block,
                      child: Text('Block'),
                    ),
                  ],
                ),
              ],
      ),
      body: Profile(),
    );
  }
}

enum _OtherUserActions {
  block,
}
