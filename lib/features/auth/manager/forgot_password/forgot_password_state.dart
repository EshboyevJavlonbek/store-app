import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus { idle, loading, error, success }

class ForgotPasswordState extends Equatable {
  final String? errorMessage;
  final ForgotPasswordStatus status;

  const ForgotPasswordState({required this.errorMessage, required this.status});

  factory ForgotPasswordState.initial() {
    return ForgotPasswordState(errorMessage: null, status: ForgotPasswordStatus.idle);
  }

  factory ForgotPasswordState.loading() {
    return ForgotPasswordState(errorMessage: null, status: ForgotPasswordStatus.loading);
  }

  factory ForgotPasswordState.success() {
    return const ForgotPasswordState(errorMessage: null, status: ForgotPasswordStatus.success);
  }

  factory ForgotPasswordState.error(String errorMessage) {
    return ForgotPasswordState(errorMessage: errorMessage, status: ForgotPasswordStatus.error);
  }

  @override
  List<Object?> get props => [errorMessage, status];
}