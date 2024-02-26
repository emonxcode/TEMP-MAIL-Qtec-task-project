import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:temp_mail/src/config/colors.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/modules/common/sneak_bar.dart';
import 'package:temp_mail/src/modules/domain_listing/bloc/domains.state.dart';
import 'package:temp_mail/src/modules/domain_listing/models/domain.mode.dart';
import 'package:temp_mail/src/modules/domain_listing/repo/domains.repo.dart';
import 'package:temp_mail/src/modules/inbox_messages/bloc/domains.state.dart';

class MessagesBloc extends Cubit<MessagesState> {
  MessagesBloc() : super(MessagesState(messages: const [], isLoading: false));

  final repository = GetIt.instance<DomainsRepository>();

  Future<void> getMessages({required BuildContext context}) async {
    dynamic response;
    List<Domain> dataList = [];
    emit(state.copyWith(MessagesState(isLoading: true, messages: const [])));

    try {
      response = await repository.getAvailableDomains();

      emit(state.copyWith(MessagesState(isLoading: false)));
      if (response != null) {
        for (var domain in response) {
          dataList.add(Domain.fromJson(domain));
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
