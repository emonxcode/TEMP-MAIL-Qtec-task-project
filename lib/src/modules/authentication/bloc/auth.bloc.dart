import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/modules/authentication/bloc/auth.state.dart';

class AuthenticationBloc extends Cubit<AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(
          pageStatus: 0,
          emailTextController: TextEditingController(),
          passwordTextController: TextEditingController(),
          showPassword: false,
        ));

  void changePageStatus(int pageStatus) {
    emit(state.copyWith(AuthenticationState(pageStatus: pageStatus)));
  }

  void showPassword() {
    emit(state
        .copyWith(AuthenticationState(showPassword: !state.showPassword!)));
  }

  Future login() async {}

  Future createAccount() async {}
}
