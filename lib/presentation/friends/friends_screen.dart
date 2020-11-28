import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/presentation/shared/widgets/photo_placeholder.dart';
import 'package:very_good_chat/shared/logger.dart';

/// Friends screen
class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendCubit, FriendState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.separated(
            itemCount: state.friends.length,
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
              return FriendsListItem(friend: state.friends[index]);
            },
          ),
        );
      },
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
                child: PhotoPlaceholder(),
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
              )
          ],
        ),
      ),
      title: Text(friend.username),
      dense: true,
    );
  }
}
