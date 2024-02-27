import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/local/shared_preference_helper.dart';
import 'package:temp_mail/src/modules/authentication/bloc/auth.state.dart';
import 'package:temp_mail/src/modules/authentication/repo/auth.repo.dart';
import 'package:temp_mail/src/modules/inbox_messages/views/messages.screen.dart';
import 'package:temp_mail/src/utils/context.dart';
import '../../../config/colors.dart';
import '../../common/sneak_bar.dart';

class AuthenticationBloc extends Cubit<AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(
          pageStatus: 0,
          emailTextController: TextEditingController(),
          passwordTextController: TextEditingController(),
          showPassword: false,
          isBtnLoading: false,
        ));

  final repository = GetIt.instance<AuthRepository>();

  void changePageStatus(int pageStatus) {
    emit(state.copyWith(AuthenticationState(pageStatus: pageStatus)));
  }

  void showPassword() {
    emit(state
        .copyWith(AuthenticationState(showPassword: !state.showPassword!)));
  }

  Future login(BuildContext context, domain) async {
    dynamic response;
    emit(state.copyWith(AuthenticationState(isBtnLoading: true)));

    try {
      var body = {
        "address": "${state.emailTextController!.text}@$domain",
        "password": state.passwordTextController!.text,
      };
      response = await repository.login(body);

      emit(state.copyWith(AuthenticationState(isBtnLoading: false)));
      if (response['token'] != null) {
        await LocalData.setToken(response['token']);
        await LocalData.setEmail("${state.emailTextController!.text}@$domain");
        await LocalData.setLoginFlag(true);

        if (context.mounted) {
          context.pushAndRemoveUntil(const MessagesScreen());
        }
      } else {
        if (context.mounted) {
          emit(state.copyWith(AuthenticationState(isBtnLoading: false)));
          QtecSneakBar.customSnackBar(
            context: context,
            snackText: something_wrong,
            snackBackgroundColor: ColorManager.redColor,
          );
        }
      }
    } catch (ex) {
      if (context.mounted) {
        emit(state.copyWith(AuthenticationState(isBtnLoading: false)));
        QtecSneakBar.customSnackBar(
          context: context,
          snackText: something_wrong,
          snackBackgroundColor: ColorManager.redColor,
        );
      }
    }
  }

  Future createAccount(BuildContext context, String domain) async {
    dynamic response;
    emit(state.copyWith(AuthenticationState(isBtnLoading: true)));

    try {
      var body = {
        "address": "${state.emailTextController!.text}@$domain",
        "password": state.passwordTextController!.text,
      };
      response = await repository.createAccount(body);

      emit(state.copyWith(AuthenticationState(isBtnLoading: false)));
      if (response['id'] != null) {
        if (context.mounted) {
          QtecSneakBar.customSnackBar(
            context: context,
            snackText: "Account created, Login now",
            snackBackgroundColor: ColorManager.greenColor,
          );
        }
        emit(state
            .copyWith(AuthenticationState(isBtnLoading: false, pageStatus: 0)));
      } else {
        if (context.mounted) {
          emit(state.copyWith(AuthenticationState(isBtnLoading: false)));
          QtecSneakBar.customSnackBar(
            context: context,
            snackText: something_wrong,
            snackBackgroundColor: ColorManager.redColor,
          );
        }
      }
    } catch (ex) {
      if (context.mounted) {
        emit(state.copyWith(AuthenticationState(isBtnLoading: false)));
        QtecSneakBar.customSnackBar(
          context: context,
          snackText: something_wrong,
          snackBackgroundColor: ColorManager.redColor,
        );
      }
    }
  }
}
