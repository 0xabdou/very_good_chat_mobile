import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';

/// Friends screen
class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendCubit, FriendState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.friends.length,
          itemBuilder: (context, index) {
            final friend = state.friends[index];
            return ListTile(
              leading: Image.network(friend.photoUrl),
              title: Text(friend.username),
              trailing: friend.isOnline
                  ? Container(
                      height: 5,
                      width: 5,
                      color: Colors.green,
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}
