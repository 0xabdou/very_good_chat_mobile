import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/presentation/profile/widgets/friendship_menu.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_button.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// Profile UI, can be used for the current user or his friends
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig.of(context);
    final cubit = context.watch<ProfileCubit>();
    final state = cubit.state;
    if (!state.initialized) return Container();
    final user = state.user;
    final relationship = state.relationship;
    var isOnline = false;
    DateTime lastSeen;
    relationship.maybeWhen(
      self: () => isOnline = true,
      friend: (io, ls) {
        isOnline = io;
        lastSeen = ls;
      },
      orElse: () {},
    );
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfilePicture(
            onPressed: () {
              // TODO: Show fullscreen photo
            },
            photoUrl: user.photoUrl,
            isOnline: isOnline,
            lastSeen: lastSeen,
            radius: sc.width(40),
            dotAlignment: const Alignment(0.85, 0.85),
            badgeAlignment: const Alignment(0.85, 0.85),
          ),
          SizedBox(height: sc.height(2)),
          Text('@${user.username}'),
          if (user.name != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: sc.height(2)),
                Text(
                  user.name,
                  style: TextStyle(fontSize: sc.width(6)),
                ),
              ],
            ),
          SizedBox(height: sc.height(2)),
          Row(
            children: [
              const Spacer(),
              _buildFriendshipButton(context, relationship),
              const Spacer(),
              _buildMessagingButton(),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFriendshipButton(BuildContext context, Relationship rs) {
    return ProfileButton(
      onPressed: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: 'Dismiss',
          transitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (_, animation, __) {
            return FriendshipMenu(
              animation: animation,
              relationship: rs,
              sc: SizeConfig.of(context),
            );
          },
        );
        return;
      },
      icon: Icon(
        rs.map(
          self: (_) => FontAwesomeIcons.userCheck,
          friend: (_) => FontAwesomeIcons.userCheck,
          requestSent: (_) => FontAwesomeIcons.userClock,
          requestReceived: (_) => FontAwesomeIcons.userClock,
          blocked: (_) => FontAwesomeIcons.ban,
          stranger: (_) => FontAwesomeIcons.userPlus,
        ),
      ),
      label: "You're friends",
    );
  }

  Widget _buildMessagingButton() {
    return ProfileButton(
      onPressed: () {},
      icon: const Icon(FontAwesomeIcons.feather),
      label: 'Send a message',
    );
  }
}
