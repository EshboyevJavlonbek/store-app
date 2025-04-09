part of "sign_up_bloc.dart";

abstract class SignUpEvent {}

class SignUpRequested extends SignUpEvent {
  final String fullName;
  final String email;
  final String password;

  SignUpRequested({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
