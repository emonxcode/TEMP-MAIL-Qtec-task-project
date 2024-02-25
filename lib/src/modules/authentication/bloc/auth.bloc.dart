import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/modules/authentication/bloc/auth.state.dart';

class AuthenticationBloc extends Cubit<AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState());

  void increment(int counterNumber) {
    emit(
      counterNumber == 1
          ? state.copyWith(AuthenticationState(counter1: state.counter1! + 1))
          : state.copyWith(AuthenticationState(counter2: state.counter2! + 1)),
    );
  }

  void decrement(int counterNumber) {
    emit(
      counterNumber == 1
          ? state.copyWith(AuthenticationState(counter1: state.counter1! - 1))
          : state.copyWith(AuthenticationState(counter2: state.counter2! - 1)),
    );
  }
}
