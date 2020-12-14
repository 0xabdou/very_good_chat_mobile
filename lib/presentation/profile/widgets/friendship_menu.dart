import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/shared/size_config.dart';

import 'profile_button.dart';

/// The bottom sheet that appears when you click on the [ProfileButton]
class FriendshipMenu extends StatefulWidget {
  /// Constructor
  const FriendshipMenu({
    Key key,
    @required this.animation,
  }) : super(key: key);

  /// This is provided by the [RoutePageBuilder] of [showGeneralDialog]
  final Animation<double> animation;

  @override
  _FriendshipMenuState createState() => _FriendshipMenuState();
}

class _FriendshipMenuState extends State<FriendshipMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..value = 1;
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String message = '';
  Color messageColor = Colors.white;
  void _showMessage(String msg, {bool error = false}) {
    setState(() {
      message = msg;
      messageColor = error ? Colors.red : Colors.white;
    });
    _controller.forward(from: 0);
  }

  void _helpShowSpinkit() {
    message = '';
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        const begin = Offset(0, 1);
        const end = Offset(0, 0);
        final tween = Tween(begin: begin, end: end);
        return Align(
          alignment: Alignment.bottomCenter,
          child: SlideTransition(
            position: widget.animation.drive(tween),
            child: Builder(builder: (context) {
              final cubit = context.watch<ProfileCubit>();
              final state = cubit.state;
              return BlocListener<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  state.friendOperation.maybeMap(
                    some: (_) {
                      _helpShowSpinkit();
                    },
                    //done: (_) => Navigator.of(context).pop(),
                    fail: (fail) {
                      final message = fail.failure.maybeMap(
                        network: (_) => 'Check your internet connection',
                        orElse: () => 'Something went wrong',
                      );
                      _showMessage(message, error: true);
                    },
                    orElse: () {},
                  );
                },
                cubit: cubit,
                child: Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: state.friendOperation.maybeMap(
                          some: (_) {
                            return SpinKitThreeBounce(
                              color: Colors.white,
                              size: sc.width(5),
                            );
                          },
                          orElse: () {
                            return Text(
                              message,
                              key: const ValueKey(
                                'friendship_menu_message',
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: sc.width(4),
                                color: messageColor,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: sc.height(0.5)),
                      Container(
                        height: sc.height(8),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(sc.height(8)),
                          ),
                        ),
                        child: Row(children: _buildActions(cubit)),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  List<Widget> _buildActions(ProfileCubit cubit) {
    return cubit.state.relationship.map(
      self: (_) => _buildFriendActions(cubit),
      friend: (_) => _buildFriendActions(cubit),
      requestSent: (_) => [],
      requestReceived: (_) => [],
      blocked: (_) => [],
      stranger: (_) => [],
    );
  }

  List<Widget> _buildFriendActions(ProfileCubit cubit) {
    final self = cubit.state.relationship.maybeMap(
      self: (_) => true,
      orElse: () => false,
    );
    final disabled = cubit.state.friendOperation.maybeMap(
      some: (_) => true,
      orElse: () => false,
    );
    return [
      Expanded(
        child: FriendshipSheetButton(
          onPressed: disabled
              ? null
              : () async {
                  if (self) {
                    _showMessage("You can't unfriend your best friend! 🥺");
                  } else {
                    // ignore: unawaited_futures
                    await cubit.unfriend(context);
                    Navigator.of(context).pop();
                  }
                },
          icon: Icons.person_remove,
          label: 'Unfriend',
          textColor: Colors.white,
          backgroundColor: Colors.red,
        ),
      ),
    ];
  }
}

/// A button that exists in the [FriendshipMenu]
class FriendshipSheetButton extends StatelessWidget {
  /// Constructor
  const FriendshipSheetButton({
    Key key,
    @required this.onPressed,
    @required this.label,
    @required this.icon,
    @required this.textColor,
    @required this.backgroundColor,
  }) : super(key: key);

  /// The on pressed callback
  final void Function() onPressed;

  /// The button's text
  final String label;

  /// The button's icon
  final IconData icon;

  /// The button's icon and text color
  final Color textColor;

  /// The button's background color
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: sc.width(7)),
              SizedBox(width: sc.width(2)),
              Text(
                label,
                style: TextStyle(fontSize: sc.width(5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
