import 'package:equatable/equatable.dart';
import 'package:temp_mail/src/modules/domain_listing/models/domain.mode.dart';

class DomainsState extends Equatable {
  DomainsState({this.available_domains, this.isLoading});

  List<Domain>? available_domains = [];
  bool? isLoading = false;

  copyWith(DomainsState state) {
    return DomainsState(
      available_domains: state.available_domains ?? available_domains,
      isLoading: state.isLoading ?? isLoading,
    );
  }

  @override
  List<Object?> get props => [available_domains];
}
