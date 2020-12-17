import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/presentation/friends/widgets/user_list_item.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// Friends screen
class BlockedUsersScreen extends StatefulWidget {
  @override
  _BlockedUsersScreenState createState() => _BlockedUsersScreenState();
}

class _BlockedUsersScreenState extends State<BlockedUsersScreen> {
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
    return BlocBuilder<FriendCubit, FriendState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Blocked users'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SizedBox(height: sc.height(2)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ListView.separated(
                    itemCount: state.blockedUsers.length,
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
                      final user = state.blockedUsers[index];
                      return UserListItem(
                        onPressed: () {
                          context
                              .read<NavigationCubit>()
                              .viewOtherProfile(user);
                        },
                        user: user,
                        sc: sc,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
