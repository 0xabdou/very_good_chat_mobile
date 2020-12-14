import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// Friends screen
class FriendRequestsScreen extends StatefulWidget {
  @override
  _FriendRequestsScreenState createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
    return BlocBuilder<FriendCubit, FriendState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Friend requests'),
            centerTitle: true,
          ),
          body: Column(
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
                      text: 'Received (${state.receivedRequests.length})',
                      active: active == 0,
                    ),
                  ),
                  SizedBox(width: sc.width(2.5)),
                  Expanded(
                    child: FriendsTabItem(
                      onTap: () {
                        if (active != 1) setState(() => active = 1);
                      },
                      text: 'Sent (${state.sentRequests.length})',
                      active: active == 1,
                    ),
                  ),
                  SizedBox(width: sc.width(5)),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _buildRequestList(
                    active == 0 ? state.receivedRequests : state.sentRequests,
                    sc,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRequestList(List<FriendRequest> requests, SizeConfig sc) {
    return ListView.separated(
      itemCount: requests.length,
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
        return RequestListItem(request: requests[index], sc: sc);
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
class RequestListItem extends StatelessWidget {
  /// Constructor
  const RequestListItem({
    Key key,
    @required this.request,
    @required this.sc,
  }) : super(key: key);

  /// The friend for this list item
  final FriendRequest request;

  /// Size config data
  final SizeConfig sc;

  @override
  Widget build(BuildContext context) {
    final user = request.user;
    return ListTile(
      onTap: () {
        print('ahahahhah');
        context.read<NavigationCubit>().viewOtherProfile(user);
      },
      leading: ProfilePicture(
        onPressed: () {
          context.read<NavigationCubit>().viewOtherProfile(user);
        },
        photoUrl: user.photoUrl,
        radius: sc.width(10),
        onlineDotRadius: sc.width(3),
        lastSeenBadgeSize: sc.width(2.5),
      ),
      title: Text(
        user.name ?? user.username,
        style: TextStyle(fontSize: sc.width(4)),
      ),
      dense: true,
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.clear, color: Colors.red),
      ),
    );
  }
}
