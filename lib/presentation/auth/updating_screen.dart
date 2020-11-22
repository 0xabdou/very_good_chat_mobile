import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/shared/injection.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

/// The screen that's shown when registering/updating profile
class UpdatingScreen extends StatefulWidget {
  ///  Constructor
  /// If [authProviderInfo] is provided, it's a registration page
  /// If [currentUser] is provided, it's a profile updating page
  const UpdatingScreen({
    Key key,
    AuthProviderInfo authProviderInfo,
    User currentUser,
  })  : assert(authProviderInfo != null || currentUser != null),
        _currentUser = currentUser,
        _authProviderInfo = authProviderInfo,
        super(key: key);

  final AuthProviderInfo _authProviderInfo;
  final User _currentUser;

  @override
  _UpdatingScreenState createState() => _UpdatingScreenState();
}

class _UpdatingScreenState extends State<UpdatingScreen> {
  UpdatingCubit cubit;
  bool registering;

  @override
  void initState() {
    cubit = getIt();
    if (widget._authProviderInfo != null) {
      registering = true;
      cubit.registering(widget._authProviderInfo);
    } else {
      registering = false;
      cubit.updating(widget._currentUser);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatingCubit, UpdatingState>(
      cubit: cubit,
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
              // ignore: unawaited_futures
              context.read<AuthCubit>().logout();
            }
            return false;
          },
          child: Scaffold(
            appBar: registering
                ? null
                : AppBar(
                    leading: IconButton(
                      onPressed: () {
                        ExtendedNavigator.root.pop();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    title: const Text('Edit profile'),
                    actions: [
                      IconButton(
                        onPressed: submitDisabled
                            ? null
                            : () {
                                cubit.submit();
                              },
                        icon: SizedBox(
                          width: 25,
                          height: 25,
                          child: state.callingApi
                              ? const CircularProgressIndicator(
                                  strokeWidth: 2,
                                )
                              : const Icon(Icons.check),
                        ),
                      ),
                    ],
                  ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      _ProfileImage(cubit: cubit),
                      TextFormField(
                        onChanged: (s) => cubit.usernameChanged(s),
                        validator: (_) => state.usernameError,
                        initialValue: state.username,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        enabled: !othersDisabled,
                      ),
                      TextFormField(
                        onChanged: (s) => cubit.nameChanged(s),
                        initialValue: state.name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        enabled: !othersDisabled,
                      ),
                      const SizedBox(height: 16),
                      // if registering
                      if (widget._authProviderInfo != null)
                        MaterialButton(
                          onPressed:
                              submitDisabled ? null : () => cubit.submit(),
                          shape: const CircleBorder(),
                          color: Theme.of(context).accentColor,
                          disabledColor:
                              Theme.of(context).accentColor.withOpacity(0.3),
                          padding: const EdgeInsets.all(16),
                          child: Icon(
                            state.callingApi
                                ? Icons.hourglass_bottom
                                : Icons.check,
                            color: Theme.of(context).primaryColor,
                          ),
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
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    Key key,
    @required this.cubit,
  }) : super(key: key);

  final UpdatingCubit cubit;

  @override
  Widget build(BuildContext context) {
    const profilePhotoSize = 150.0;
    return BlocBuilder<UpdatingCubit, UpdatingState>(
      cubit: cubit,
      builder: (context, state) {
        final disabled = state.uploadingPhoto || state.callingApi;
        return Align(
          child: SizedBox(
            height: profilePhotoSize,
            width: profilePhotoSize,
            child: Stack(
              children: [
                Container(
                  height: profilePhotoSize,
                  width: profilePhotoSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      profilePhotoSize,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _getImageProvider(state),
                    ),
                  ),
                ),
                if (state.uploadingPhoto)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          profilePhotoSize,
                        ),
                        color: Theme.of(context).accentColor.withOpacity(0.3),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Material(
                    elevation: 5,
                    shape: const CircleBorder(),
                    color: Theme.of(context).accentColor.withOpacity(
                          disabled ? 0.3 : 1,
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: disabled
                            ? null
                            : () {
                                cubit.pickPhoto(context);
                              },
                        child: Icon(
                          Icons.edit,
                          size: 20,
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
      },
    );
  }

  ImageProvider _getImageProvider(UpdatingState state) {
    if (state.photoBytes != null) {
      return MemoryImage(
        state.photoBytes,
      );
    }
    if (state.photoUrl != null) {
      return NetworkImage(
        state.photoUrl,
      );
    }
    // TODO: provide proper placeholder
    return const AssetImage('');
  }
}
