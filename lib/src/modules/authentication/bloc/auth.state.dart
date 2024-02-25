import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  AuthenticationState({this.counter1, this.counter2});
  int? counter1 = 0;
  int? counter2 = 0;
  copyWith(AuthenticationState homeState) {
    return AuthenticationState(
        counter1: homeState.counter1 ?? counter1,
        counter2: homeState.counter2 ?? counter2);
  }

  @override
  List<Object?> get props => [counter1, counter2];
}
