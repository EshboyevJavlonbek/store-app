import 'package:equatable/equatable.dart';

enum VerificationStatus { idle, loading, error, success }

class VerificationState extends Equatable {
  final String? errorMessage;
  final VerificationStatus status;

  const VerificationState({required this.errorMessage, required this.status});

  factory VerificationState.initial() {
    return VerificationState(errorMessage: null, status: VerificationStatus.idle);
  }

  factory VerificationState.loading() {
    return VerificationState(errorMessage: null, status: VerificationStatus.loading);
  }

  factory VerificationState.success() {
    return const VerificationState(
      errorMessage: null,
      status: VerificationStatus.success,
    );
  }

  factory VerificationState.error(String errorMessage) {
    return VerificationState(
      errorMessage: errorMessage,
      status: VerificationStatus.error,
    );
  }

  @override
  List<Object?> get props => [errorMessage, status];
}
