import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_chat/application/auth/registration/registration_cubit.dart';
import 'package:very_good_chat/domain/auth/auth_provider_info.dart';
import 'package:very_good_chat/shared/injection.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key key,
    @required this.authProviderInfo,
  }) : super(key: key);

  final AuthProviderInfo authProviderInfo;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegistrationCubit cubit;

  @override
  void initState() {
    cubit = getIt()..init(widget.authProviderInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      cubit: cubit,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: state.photoUrl != null
                            ? DecorationImage(
                                image: NetworkImage(state.photoUrl),
                              )
                            : null,
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
                    ),
                    TextFormField(
                      onChanged: (s) => cubit.nameChanged(s),
                      initialValue: state.name,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 16),
                    MaterialButton(
                      onPressed: state.usernameError == null ? () {} : null,
                      shape: const CircleBorder(),
                      color: Theme.of(context).accentColor,
                      disabledColor:
                          Theme.of(context).accentColor.withOpacity(0.3),
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
