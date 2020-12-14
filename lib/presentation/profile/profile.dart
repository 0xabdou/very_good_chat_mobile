import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/presentation/profile/widgets/friendship_menu.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_button.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/shared/size_config.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

/// Profile UI, can be used for the current user or his friends
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
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
    final tag = '$kTagProfilePhoto${user.id}';
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: tag,
            child: ProfilePicture(
              onPressed: () {
                context.read<NavigationCubit>().viewFullPicture(
                      photoUrl: user.photoUrl,
                      heroTag: tag,
                    );
              },
              photoUrl: user.photoUrl,
              isOnline: isOnline,
              lastSeen: lastSeen,
              radius: sc.width(40),
              dotAlignment: const Alignment(0.85, 0.85),
              badgeAlignment: const Alignment(0.85, 0.85),
            ),
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
          _buildProfileButtons(context, cubit),
        ],
      ),
    );
  }

  Widget _buildProfileButtons(BuildContext context, ProfileCubit cubit) {
    List<Widget> children;
    final sc = SizeConfig(context);
    final loading = cubit.state.friendOperation.maybeMap(
      some: (_) => true,
      orElse: () => false,
    );
    if (loading) {
      children = [
        const Spacer(),
        SpinKitThreeBounce(color: Colors.white, size: sc.width(5)),
        const Spacer(),
      ];
    } else {
      final friends = cubit.state.relationship.maybeMap(
        friend: (_) => true,
        self: (_) => true,
        orElse: () => false,
      );
      children = [
        const Spacer(),
        _buildFriendshipButton(context, cubit),
        const Spacer(),
      ];
      if (friends) {
        children.addAll([
          _buildMessagingButton(),
          const Spacer(),
        ]);
      }
    }
    return SizedBox(
      height: sc.height(20),
      child: Center(child: Row(children: children)),
    );
  }

  Widget _buildFriendshipButton(BuildContext context, ProfileCubit cubit) {
    IconData icon;
    String text;
    void Function() onPressed = () {
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: 'Dismiss',
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, animation, __) {
          return BlocProvider<ProfileCubit>.value(
            value: cubit,
            child: FriendshipMenu(animation: animation),
          );
        },
      );
    };
    cubit.state.relationship.map(
      self: (_) {
        icon = FontAwesomeIcons.userCheck;
        text = "You're friends";
      },
      friend: (_) {
        icon = FontAwesomeIcons.userCheck;
        text = "You're friends";
      },
      requestSent: (_) {
        icon = FontAwesomeIcons.userClock;
        text = 'Request sent';
      },
      requestReceived: (_) {
        icon = FontAwesomeIcons.userClock;
        text = 'Request received';
      },
      blocked: (_) {
        icon = FontAwesomeIcons.ban;
        text = 'Blocked';
      },
      stranger: (_) {
        icon = FontAwesomeIcons.userPlus;
        text = 'Add friend';
        onPressed = () async {
          final yes = await DialogUtils.instance.showYesNoDialog(
            context,
            title: 'Add friend',
            content: 'Do you want to send a friend request to this person?',
          );
          if (yes) {
            // TODO: Send friend request
            // ignore: unawaited_futures
            cubit.sendFriendRequest();
          }
        };
      },
    );
    return ProfileButton(
      onPressed: onPressed,
      icon: Icon(icon),
      label: text,
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
