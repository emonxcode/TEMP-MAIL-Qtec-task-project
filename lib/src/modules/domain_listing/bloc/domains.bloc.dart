import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:temp_mail/src/config/colors.dart';
import 'package:temp_mail/src/modules/common/sneak_bar.dart';
import 'package:temp_mail/src/modules/domain_listing/bloc/domains.state.dart';
import 'package:temp_mail/src/modules/domain_listing/models/domain.mode.dart';
import 'package:temp_mail/src/modules/domain_listing/repo/domains.repo.dart';

class DomainsBloc extends Cubit<DomainsState> {
  DomainsBloc()
      : super(DomainsState(available_domains: const [], isLoading: false));

  final repository = GetIt.instance<DomainsRepository>();

  Future<void> getAvailableDomains({required BuildContext context}) async {
    dynamic response;
    List<Domain> dataList = [];
    emit(state
        .copyWith(DomainsState(isLoading: true, available_domains: const [])));

    try {
      response = await repository.getAvailableDomains();

      emit(state.copyWith(DomainsState(isLoading: false)));
      if (response != null) {
        for (var domain in response) {
          dataList.add(Domain.fromJson(domain));
        }
        emit(state.copyWith(
            DomainsState(isLoading: false, available_domains: dataList)));
      } else {
        if (context.mounted) {
          emit(state.copyWith(
              DomainsState(isLoading: false, available_domains: const [])));
          QtecSneakBar.customSnackBar(
            context: context,
            snackText: response['message'],
            snackBackgroundColor: ColorManager.redColor,
          );
        }
      }
    } catch (ex) {
      if (context.mounted) {
        emit(state.copyWith(
            DomainsState(isLoading: false, available_domains: const [])));
        QtecSneakBar.customSnackBar(
          context: context,
          snackText: ex.toString(),
          snackBackgroundColor: ColorManager.redColor,
        );
      }
    }
  }
}
