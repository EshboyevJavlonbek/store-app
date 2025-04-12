part of'reset_password_bloc.dart';
sealed class ResetPasswordEvent {}

class ResetPasswordRequest extends ResetPasswordEvent{
  final String email, code, password;

  ResetPasswordRequest({
    required this.email,
    required this.code,
    required this.password,
  });
}
