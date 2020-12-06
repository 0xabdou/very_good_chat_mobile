import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/shared/size_config.dart';

import 'profile_button.dart';

/// The bottom sheet that appears when you click on the [ProfileButton]
class FriendshipMenu extends StatefulWidget {
  /// Constructor
  const FriendshipMenu({
    Key key,
    @required this.animation,
    @required this.relationship,
  }) : super(key: key);

  /// This is provided by the [RoutePageBuilder] of [showGeneralDialog]
  final Animation<double> animation;

  /// The relationship
  final Relationship relationship;

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
    );
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
  void _showMessage(String msg) {
    setState(() {
      message = msg;
    });
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
            child: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: sc.width(4)),
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
                    child: Row(children: _buildActions()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildActions() {
    return widget.relationship.map(
      self: (_) => _buildFriendActions(self: true),
      friend: (_) => _buildFriendActions(),
      requestSent: (_) => [],
      requestReceived: (_) => [],
      blocked: (_) => [],
      stranger: (_) => [],
    );
  }

  List<Widget> _buildFriendActions({bool self = false}) {
    return [
      Expanded(
        child: FriendshipSheetButton(
          onPressed: () {
            if (self) {
              _showMessage("You can't unfriend your best friend! 🥺");
            }
          },
          icon: Icons.person_remove,
          label: 'Unfriend',
          textColor: Colors.white,
          backgroundColor: Colors.red,
        ),
      ),
      Expanded(
        child: FriendshipSheetButton(
          onPressed: () {
            if (self) {
              _showMessage('Blocking yourself is not a good idea!');
            }
          },
          icon: FontAwesomeIcons.ban,
          label: 'Block',
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
