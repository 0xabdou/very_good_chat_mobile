import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/presentation/shared/widgets/loading_photo_placeholder.dart';
import 'package:very_good_chat/shared/logger.dart';

/// Friends screen
class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendCubit, FriendState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: FriendsTabItem(
                    onTap: () {
                      if (active != 0) setState(() => active = 0);
                    },
                    text: 'Active (${state.onlineFriends.length})',
                    active: active == 0,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FriendsTabItem(
                    onTap: () {
                      if (active != 1) setState(() => active = 1);
                    },
                    text: 'All (${state.allFriends.length})',
                    active: active == 1,
                  ),
                ),
                const SizedBox(width: 16)
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _buildFriendsList(
                  active == 0 ? state.onlineFriends : state.allFriends,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFriendsList(List<Friend> friends) {
    return ListView.separated(
      itemCount: friends.length,
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0,
          indent: 70,
          endIndent: 16,
          thickness: 0.15,
          color: Colors.white,
        );
      },
      itemBuilder: (context, index) {
        return FriendsListItem(friend: friends[index]);
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
    @required this.text,
    @required this.active,
    @required this.onTap,
  }) : super(key: key);

  /// The text to display
  final String text;

  /// True if this item is active
  final bool active;

  /// Callback for when this item is clicked
  final void Function() onTap;

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
  }) : super(key: key);

  /// The friend for this list item
  final Friend friend;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        logger.wtf('Go to conversation');
      },
      leading: SizedBox(
        height: 40,
        width: 40,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: friend.photoUrl,
              imageBuilder: (context, imageProvider) {
                return Material(
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: Ink.image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {
                        logger.wtf('Go to profile');
                      },
                    ),
                  ),
                );
              },
              placeholder: (_, __) => ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LoadingPhotoPlaceholder(),
              ),
            ),
            if (friend.isOnline)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            if (!friend.isOnline)
              Positioned(
                bottom: 0,
                right: 0,
                child: LastSeenBadgeToBeDeprecated(lastSeen: friend.lastSeen),
              ),
          ],
        ),
      ),
      title: Text(friend.username),
      dense: true,
    );
  }
}

/// Used by [FriendsListItem] to display how long was the user offline
@visibleForTesting
class LastSeenBadgeToBeDeprecated extends StatelessWidget {
  /// Constructor
  const LastSeenBadgeToBeDeprecated({
    Key key,
    @required this.lastSeen,
  }) : super(key: key);

  /// The time when the user was last seen
  final DateTime lastSeen;

  @override
  Widget build(BuildContext context) {
    final duration = _duration;
    if (duration == null) return Container();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).primaryColor,
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.green.shade700.withOpacity(0.2),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 2,
        ),
        child: Text(
          duration,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String get _duration {
    if (lastSeen == null) return null;
    final now = DateTime.now().millisecondsSinceEpoch;
    final then = lastSeen.millisecondsSinceEpoch;
    final diff = now - then;
    if (diff == 0) return '0m';
    final minutes = diff ~/ 60000;
    if (minutes < 60) return '${minutes}m';
    final hours = minutes ~/ 60;
    if (hours < 24) return '${hours}h';
    if (hours < 48) return '1d';
    return null;
  }
}
