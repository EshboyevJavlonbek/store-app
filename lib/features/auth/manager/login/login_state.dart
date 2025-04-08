import 'package:equatable/equatable.dart';

enum LoginStatus { idle, loading, error, success }

class LoginState extends Equatable {
  final String? errorMessage;
  final LoginStatus status;

  const LoginState({
    required this.errorMessage,
    required this.status,
  });

  factory LoginState.initial() {
    return const LoginState(
      errorMessage: null,
      status: LoginStatus.idle,
    );
  }

  factory LoginState.loading() {
    return const LoginState(
      errorMessage: null,
      status: LoginStatus.loading,
    );
  }

  factory LoginState.success() {
    return const LoginState(
      errorMessage: null,
      status: LoginStatus.success,
    );
  }

  factory LoginState.error(String errorMessage) {
    return LoginState(
      errorMessage: errorMessage,
      status: LoginStatus.error,
    );
  }

  @override
  List<Object?> get props => [errorMessage, status];
}
