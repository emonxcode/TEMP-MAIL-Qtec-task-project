import 'package:equatable/equatable.dart';
import 'package:temp_mail/src/modules/domain_listing/models/domain.mode.dart';

class DomainsState extends Equatable {
  DomainsState({this.available_domains, this.isLoading});

  List<Domain>? available_domains = [];
  bool? isLoading = false;

  copyWith(DomainsState homeState) {
    return DomainsState(
      available_domains: homeState.available_domains ?? available_domains,
      isLoading: homeState.isLoading ?? isLoading,
    );
  }

  @override
  List<Object?> get props => [available_domains];
}
