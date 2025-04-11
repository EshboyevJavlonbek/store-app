part of'forgot_password_bloc.dart';
sealed class ForgotPasswordEvent {}

class ForgotPasswordRequested extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordRequested({required this.email});
}
