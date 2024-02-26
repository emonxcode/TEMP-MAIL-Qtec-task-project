import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:temp_mail/src/config/colors.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/local/shared_preference_helper.dart';
import 'package:temp_mail/src/modules/common/sneak_bar.dart';
import 'package:temp_mail/src/modules/domain_listing/bloc/domains.state.dart';
import 'package:temp_mail/src/modules/domain_listing/models/domain.mode.dart';
import 'package:temp_mail/src/modules/domain_listing/repo/domains.repo.dart';
import 'package:temp_mail/src/modules/inbox_messages/bloc/messages.state.dart';
import 'package:temp_mail/src/modules/inbox_messages/models/email.model.dart';
import 'package:temp_mail/src/modules/inbox_messages/repo/messages.repo.dart';
import 'package:temp_mail/src/utils/connectivity.dart';

import '../../../local/sqflite_db_helper.dart';

class MessagesBloc extends Cubit<MessagesState> {
  MessagesBloc() : super(MessagesState(messages: const [], isLoading: false));

  final repository = GetIt.instance<MessagesRepository>();
  final localDB = GetIt.instance<SqfliteDatabaseHelper>();

  Future<void> getEmail() async {
    var email = await LocalData.getEmail();
    emit(state.copyWith(MessagesState(email: email)));
  }

  Future<void> getMessages({required BuildContext context}) async {
    dynamic response;
    List<Email> dataList = [];
    emit(state.copyWith(MessagesState(isLoading: true, messages: const [])));

    try {
      var result = await checkInternetConnectivity();
      if (!result) {
        dataList = await localDB.getAllMessages();
        emit(state
            .copyWith(MessagesState(isLoading: false, messages: dataList)));
        return;
      }
      response = await repository.getMessages();

      emit(state.copyWith(MessagesState(isLoading: false)));
      if (response != null) {
        await localDB.deleteMessages();
        for (var message in response) {
          dataList.add(Email.fromJson(message));
          await localDB.insertMessage(Email.fromJson(message));
        }
        emit(state
            .copyWith(MessagesState(isLoading: false, messages: dataList)));
      } else {
        if (context.mounted) {
          emit(state
              .copyWith(MessagesState(isLoading: false, messages: const [])));
          QtecSneakBar.customSnackBar(
            context: context,
            snackText: something_wrong,
            snackBackgroundColor: ColorManager.redColor,
          );
        }
      }
    } catch (ex) {
      if (context.mounted) {
        emit(state
            .copyWith(MessagesState(isLoading: false, messages: const [])));
        QtecSneakBar.customSnackBar(
          context: context,
          snackText: something_wrong,
          snackBackgroundColor: ColorManager.redColor,
        );
      }
    }
  }
}
