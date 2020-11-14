import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/auth_cubit.dart';
import 'package:very_good_chat/application/auth/registration/registration_cubit.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/shared/injection.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    Key key,
    @required this.authProviderInfo,
  }) : super(key: key);

  final AuthProviderInfo authProviderInfo;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationCubit cubit;

  @override
  void initState() {
    cubit = getIt()..init(widget.authProviderInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const profilePhotoSize = 150.0;
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      cubit: cubit,
      listener: (context, state) {
        if (state.done) {
          context.read<AuthCubit>().checkAuthStatus();
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
              context.read<AuthCubit>().logout();
            }
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Align(
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
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Material(
                                  elevation: 5,
                                  shape: const CircleBorder(),
                                  color:
                                      Theme.of(context).accentColor.withOpacity(
                                            othersDisabled ? 0.3 : 1,
                                          ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: othersDisabled
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
                      ),
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
                      MaterialButton(
                        onPressed: submitDisabled ? null : () => cubit.submit(),
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

  ImageProvider _getImageProvider(RegistrationState state) {
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
    return const AssetImage('');
  }
}
