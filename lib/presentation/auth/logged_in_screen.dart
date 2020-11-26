import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/presentation/friends/friends_screen.dart';
import 'package:very_good_chat/shared/injection.dart';
import 'package:very_good_chat/shared/logger.dart';
import 'package:very_good_chat/shared/router.gr.dart';

/// The screen that's shown if the user is logged in
class LoggedInScreen extends StatefulWidget {
  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    final user = authCubit.state.maybeWhen(
      loggedIn: (u) => u,
      orElse: () => null,
    );
    if (user == null) {
      logger.w('Building LoggedInPage without a logged in user');
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              ExtendedNavigator.root.push(
                Routes.updatingScreen,
                arguments: UpdatingScreenArguments(
                  cubit: getIt(),
                  currentUser: user,
                ),
              );
            },
            borderRadius: BorderRadius.circular(100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user.photoUrl,
              ),
            ),
          ),
        ),
        title: const Text('Chats'),
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
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
        ],
      ),
    );
  }
}
