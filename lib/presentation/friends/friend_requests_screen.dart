import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:very_good_chat/application/friends/friend_cubit.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/presentation/core/navigation/navigation_cubit.dart';
import 'package:very_good_chat/presentation/friends/widgets/friend_tab_item.dart';
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
                  child: _buildRequests(state, sc, active == 1),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRequests(FriendState state, SizeConfig sc, bool sent) {
    final requests = sent ? state.sentRequests : state.receivedRequests;
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
        final request = requests[index];
        final beingTreated =
            state.requestsBeingTreated.contains(request.user.id);
        return RequestListItem(
          request: request,
          sc: sc,
          beingTreated: beingTreated,
        );
      },
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
    this.beingTreated = false,
  }) : super(key: key);

  /// The friend for this list item
  final FriendRequest request;

  /// Size config data
  final SizeConfig sc;

  /// Is this requests being treated? (being canceled, accepted, or declined)
  final bool beingTreated;

  @override
  Widget build(BuildContext context) {
    final user = request.user;
    return ListTile(
      onTap: () {
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
      trailing: _getTrailing(context, sc),
    );
  }

  Widget _getTrailing(BuildContext context, SizeConfig sc) {
    if (beingTreated) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitThreeBounce(
            color: Colors.white,
            size: sc.width(4),
          ),
        ],
      );
    }
    if (request.sent) {
      return IconButton(
        onPressed: () {
          context
              .read<FriendCubit>()
              .cancelFriendRequest(request.user.id, context);
        },
        icon: const Icon(Icons.clear, color: Colors.red),
      );
    }
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check, color: Colors.green),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear, color: Colors.red),
        ),
      ],
    );
  }
}
