import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/router.gr.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// Friends screen
class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
    return BlocBuilder<FriendCubit, FriendState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: sc.height(2)),
            Row(
              children: [
                SizedBox(width: sc.width(5)),
                Expanded(
                  child: FriendsTabItem(
                    onTap: () {
                      if (active != 0) setState(() => active = 0);
                    },
                    text: 'Active (${state.onlineFriends.length})',
                    active: active == 0,
                  ),
                ),
                SizedBox(width: sc.width(2.5)),
                Expanded(
                  child: FriendsTabItem(
                    onTap: () {
                      if (active != 1) setState(() => active = 1);
                    },
                    text: 'All (${state.allFriends.length})',
                    active: active == 1,
                  ),
                ),
                SizedBox(width: sc.width(5)),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _buildFriendsList(
                  active == 0 ? state.onlineFriends : state.allFriends,
                  sc,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFriendsList(List<Friend> friends, SizeConfig sc) {
    return ListView.separated(
      itemCount: friends.length,
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
          indent: sc.width(20),
          endIndent: sc.width(5),
          thickness: sc.height(0.02),
          color: Colors.white,
        );
      },
      itemBuilder: (context, index) {
        return FriendsListItem(friend: friends[index], sc: sc);
      },
    );
  }
}

/// Tab bar item for friends screen
@visibleForTesting
class FriendsTabItem extends StatelessWidget {
  /// Constructor
  const FriendsTabItem({
    Key key,
    @required this.onTap,
    @required this.text,
    @required this.active,
  }) : super(key: key);

  /// Callback for when this item is clicked
  final void Function() onTap;

  /// The text to display
  final String text;

  /// True if this item is active
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? Colors.grey.shade900 : Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

/// List item for friends list
@visibleForTesting
class FriendsListItem extends StatelessWidget {
  /// Constructor
  const FriendsListItem({
    Key key,
    @required this.friend,
    @required this.sc,
  }) : super(key: key);

  /// The friend for this list item
  final Friend friend;

  /// Size config data
  final SizeConfig sc;

  @override
  Widget build(BuildContext context) {
    final tag = '$kTagProfilePhoto${friend.id}';
    return ListTile(
      onTap: () {
        logger.wtf('Go to conversation');
      },
      leading: Hero(
        tag: tag,
        child: ProfilePicture(
          onPressed: () {
            ExtendedNavigator.root.push(
              Routes.profileScreen,
              arguments: ProfileScreenArguments(
                user: friend.toUser(),
              ),
            );
          },
          photoUrl: friend.photoUrl,
          isOnline: friend.isOnline,
          lastSeen: friend.lastSeen,
          radius: sc.width(10),
          onlineDotRadius: sc.width(3),
          lastSeenBadgeSize: sc.width(2.5),
        ),
      ),
      title: Text(
        friend.name ?? friend.username,
        style: TextStyle(fontSize: sc.width(4)),
      ),
      dense: true,
    );
  }
}
