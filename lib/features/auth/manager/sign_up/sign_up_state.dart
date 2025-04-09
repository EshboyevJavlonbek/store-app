import 'package:equatable/equatable.dart';

enum SignUpStatus { idle, loading, error, success }

class SignUpState extends Equatable {
  final String? errorMessage;
  final SignUpStatus status;

  const SignUpState({required this.errorMessage, required this.status});

  factory SignUpState.initial() {
    return SignUpState(errorMessage: null, status: SignUpStatus.idle);
  }

  factory SignUpState.loading() {
    return SignUpState(errorMessage: null, status: SignUpStatus.loading);
  }

  factory SignUpState.success() {
    return const SignUpState(errorMessage: null, status: SignUpStatus.success);
  }

  factory SignUpState.error(String errorMessage) {
    return SignUpState(errorMessage: errorMessage, status: SignUpStatus.error);
  }

  @override
  List<Object?> get props => [errorMessage, status];
}
