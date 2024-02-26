import 'package:equatable/equatable.dart';
import '../models/email.model.dart';

class MessagesState extends Equatable {
  MessagesState({this.messages, this.isLoading, this.email});

  List<Email>? messages = [];
  bool? isLoading = false;
  String? email;

  copyWith(MessagesState state) {
    return MessagesState(
      messages: state.messages ?? messages,
      isLoading: state.isLoading ?? isLoading,
      email: state.email ?? email,
    );
  }

  @override
  List<Object?> get props => [messages, isLoading, email];
}
