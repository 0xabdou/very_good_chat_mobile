import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/presentation/friends/widgets/friend_tab_item.dart';
import 'package:very_good_chat/presentation/friends/widgets/user_list_item.dart';
import 'package:very_good_chat/shared/logger.dart';
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
        final friend = friends[index];
        final user = friend.toUser();
        return UserListItem(
          onPressed: () {
            logger.wtf('Go to conversation');
          },
          onPhotoPressed: () {
            context.read<NavigationCubit>().viewOtherProfile(user);
          },
          user: user,
          isOnline: friend.isOnline,
          lastSeen: friend.lastSeen,
          sc: sc,
        );
      },
    );
  }
}
