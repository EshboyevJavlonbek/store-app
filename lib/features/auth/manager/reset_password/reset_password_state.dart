import 'package:equatable/equatable.dart';

enum ResetPasswordStatus { idle, loading, error, success }

class ResetPasswordState extends Equatable {
  final String? errorMessage;
  final ResetPasswordStatus status;

  const ResetPasswordState({required this.errorMessage, required this.status});

  factory ResetPasswordState.initial() {
    return ResetPasswordState(errorMessage: null, status: ResetPasswordStatus.idle);
  }

  factory ResetPasswordState.loading() {
    return ResetPasswordState(errorMessage: null, status: ResetPasswordStatus.loading);
  }

  factory ResetPasswordState.success() {
    return const ResetPasswordState(
      errorMessage: null,
      status: ResetPasswordStatus.success,
    );
  }

  factory ResetPasswordState.error(String errorMessage) {
    return ResetPasswordState(
      errorMessage: errorMessage,
      status: ResetPasswordStatus.error,
    );
  }

  @override
  List<Object?> get props => [errorMessage, status];
}
