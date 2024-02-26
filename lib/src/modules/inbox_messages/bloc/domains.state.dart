import 'package:equatable/equatable.dart';
import 'package:temp_mail/src/modules/domain_listing/models/domain.mode.dart';

class MessagesState extends Equatable {
  MessagesState({this.messages, this.isLoading});

  List<Domain>? messages= [];
  bool? isLoading = false;

  copyWith(MessagesState state) {
    return MessagesState(
      messages: state.messages ?? messages,
      isLoading: state.isLoading ?? isLoading,
    );
  }

  @override
  List<Object?> get props => [messages, isLoading];
}
