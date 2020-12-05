import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/presentation/shared/widgets/default_photo.dart';
import 'package:very_good_chat/presentation/shared/widgets/loading_photo_placeholder.dart';
import 'package:very_good_chat/shared/size_config.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

/// The screen that's shown when registering/updating profile
class UpdatingScreen extends StatelessWidget {
  ///  Constructor
  const UpdatingScreen({
    Key key,
    @required UpdatingCubit cubit,
  })  : _cubit = cubit,
        super(key: key);

  final UpdatingCubit _cubit;

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig.of(context);
    return BlocConsumer<UpdatingCubit, UpdatingState>(
      cubit: _cubit,
      listener: (context, state) {
        if (state.done) {
          ExtendedNavigator.root.pop();
        }
      },
      builder: (context, state) {
        final submitDisabled = state.username.isEmpty ||
            state.usernameError != null ||
            state.callingApi;
        final othersDisabled = state.callingApi;
        return WillPopScope(
          onWillPop: () async {
            final result = (await yesNoDialog(context)) ?? false;
            if (result) {
              if (state.registering)
                context.read<AuthCubit>().logout();
              else
                return true;
            }
            return false;
          },
          child: Scaffold(
            appBar: state.registering
                ? null
                : _getAppBar(
                    submitDisabled: submitDisabled,
                    loading: state.callingApi,
                    sc: sc,
                  ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sc.width(18)),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      UpdatingProfilePicture(
                        state: state,
                        onEditPressed: () => _cubit.pickPhoto(context),
                      ),
                      TextFormField(
                        onChanged: _cubit.usernameChanged,
                        validator: (_) => state.usernameError,
                        initialValue: state.username,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: sc.width(4.5),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        enabled: !othersDisabled,
                      ),
                      TextFormField(
                        onChanged: _cubit.nameChanged,
                        initialValue: state.name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            fontSize: sc.width(4.5),
                          ),
                        ),
                        enabled: !othersDisabled,
                      ),
                      SizedBox(height: sc.height(3)),
                      if (state.registering)
                        RegistrationSubmitButton(
                          onPressed: submitDisabled ? null : _cubit.submit,
                          loading: state.callingApi,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _getAppBar({
    @required bool submitDisabled,
    @required bool loading,
    @required SizeConfigData sc,
  }) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          ExtendedNavigator.root.pop();
        },
        icon: const Icon(Icons.clear),
      ),
      title: const Text('Edit profile'),
      actions: [
        IconButton(
          onPressed: submitDisabled ? null : _cubit.submit,
          icon: loading
              ? SizedBox(
                  width: sc.height(4),
                  height: sc.height(4),
                  child: CircularProgressIndicator(
                    strokeWidth: sc.width(0.5),
                  ),
                )
              : const Icon(Icons.check),
        ),
      ],
    );
  }
}

/// Profile image for updating screen
@visibleForTesting
class UpdatingProfilePicture extends StatelessWidget {
  /// Constructor
  const UpdatingProfilePicture({
    Key key,
    @required this.state,
    @required this.onEditPressed,
  }) : super(key: key);

  ///  Updating state
  final UpdatingState state;

  /// Call back for when the edit button is pressed
  final void Function() onEditPressed;

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig.of(context);
    final profilePhotoSize = sc.width(40);
    final disabled = state.uploadingPhoto || state.callingApi;
    return Align(
      child: SizedBox(
        height: profilePhotoSize,
        width: profilePhotoSize,
        child: Stack(
          children: [
            // The actual photo
            ClipRRect(
              borderRadius: BorderRadius.circular(profilePhotoSize),
              child: SizedBox(
                height: profilePhotoSize,
                width: profilePhotoSize,
                child: _getImage(state),
              ),
            ),
            // A spinner + overlay, visible while uploading
            if (state.uploadingPhoto)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(profilePhotoSize),
                    color: Theme.of(context).accentColor.withOpacity(0.3),
                  ),
                  child: const CircularProgressIndicator(),
                ),
              ),
            // An edit button
            Positioned(
              bottom: sc.height(2),
              right: sc.width(2),
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                color: Theme.of(context)
                    .accentColor
                    .withOpacity(disabled ? 0.3 : 1),
                child: Padding(
                  padding: EdgeInsets.all(sc.width(1)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(sc.width(6)),
                    onTap: disabled ? null : onEditPressed,
                    child: Icon(
                      Icons.edit,
                      size: sc.width(6),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImage(UpdatingState state) {
    if (state.photoBytes != null) {
      return Image.memory(
        state.photoBytes,
      );
    }
    if (state.photoUrl != null) {
      return CachedNetworkImage(
        imageUrl: state.photoUrl,
        placeholder: (_, __) => LoadingPhotoPlaceholder(),
      );
    }
    return DefaultPhoto();
  }
}

/// The registration screen's submit button
@visibleForTesting
class RegistrationSubmitButton extends StatelessWidget {
  /// Constructor
  const RegistrationSubmitButton({
    Key key,
    @required this.onPressed,
    @required this.loading,
  }) : super(key: key);

  /// Callback for when the button is pressed
  final void Function() onPressed;

  /// if true, shows a spinner
  /// if false, shows a check mark icon
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig.of(context);
    return Material(
      shape: const CircleBorder(),
      color: Theme.of(context).accentColor.withOpacity(
            onPressed == null ? 0.3 : 1,
          ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(sc.width(4)),
          child: SizedBox(
            width: sc.width(8),
            height: sc.width(8),
            child: Center(
              child: loading
                  ? SpinKitThreeBounce(
                      color: Colors.white,
                      size: sc.height(2.5),
                    )
                  : Icon(Icons.check, color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
