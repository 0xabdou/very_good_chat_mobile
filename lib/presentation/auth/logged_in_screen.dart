import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/presentation/friends/friends_screen.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/router.gr.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// The screen that's shown if the user is logged in
class LoggedInScreen extends StatefulWidget {
  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  final chatsKey = UniqueKey();
  final peopleKey = UniqueKey();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
    final authCubit = context.watch<AuthCubit>();
    final user = authCubit.state.maybeWhen(
      loggedIn: (u) => u,
      orElse: () => null,
    );
    if (user == null) {
      logger.w('Building LoggedInPage without a logged in user');
      return Container();
    }
    final tag = '$kTagProfilePhoto${user.id}';
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(sc.width(2.5)),
          child: Hero(
            tag: tag,
            child: ProfilePicture(
              onPressed: () {
                ExtendedNavigator.root.push(
                  Routes.profileScreen,
                  arguments: ProfileScreenArguments(user: user),
                );
              },
              photoUrl: user.photoUrl,
              isOnline: false,
            ),
          ),
        ),
        title: AnimatedSwitcher(
          child: activeIndex == 0
              ? Text(
                  'Chats',
                  key: chatsKey,
                  style: TextStyle(fontSize: sc.width(6)),
                )
              : Text(
                  'People',
                  key: peopleKey,
                  style: TextStyle(fontSize: sc.width(6)),
                ),
          duration: const Duration(milliseconds: 400),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: activeIndex == 0
          ? Center(
              child: RaisedButton(
                onPressed: authCubit.logout,
                child: const Text('Logout'),
              ),
            )
          : FriendsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        currentIndex: activeIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedFontSize: sc.width(4),
        unselectedFontSize: sc.width(4),
        iconSize: sc.width(8),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
            ),
            label: 'Chats',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: 'Friends',
          ),
        ],
      ),
    );
  }
}
