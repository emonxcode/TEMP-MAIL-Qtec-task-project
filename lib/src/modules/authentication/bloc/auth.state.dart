import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AuthenticationState extends Equatable {
  AuthenticationState(
      {this.pageStatus,
      this.emailTextController,
      this.passwordTextController,
      this.showPassword,
      this.isBtnLoading});

  int? pageStatus = 0;
  TextEditingController? emailTextController = TextEditingController();
  TextEditingController? passwordTextController = TextEditingController();
  bool? showPassword = false;
  bool? isBtnLoading = false;

  copyWith(AuthenticationState state) {
    return AuthenticationState(
      pageStatus: state.pageStatus ?? pageStatus,
      emailTextController: state.emailTextController ?? emailTextController,
      passwordTextController:
          state.passwordTextController ?? passwordTextController,
      showPassword: state.showPassword ?? showPassword,
      isBtnLoading: state.isBtnLoading ?? isBtnLoading,
    );
  }

  @override
  List<Object?> get props =>
      [pageStatus, emailTextController, passwordTextController, showPassword, isBtnLoading];
}
