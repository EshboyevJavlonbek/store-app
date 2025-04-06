// import 'package:equatable/equatable.dart';
//
// enum LoginStatus { idle, loading, error }
//
// class LoginState extends Equatable {
//   final String? errorMessage;
//   final LoginStatus? status;
//
//   const LoginState({
//     required this.errorMessage,
//     required this.status,
//   });
//
//   factory LoginState.initial() {
//     return LoginState(
//       errorMessage: null,
//       status: LoginStatus.loading,
//     );
//   }
//
//   LoginState copyWidth({
//     String? errorMessage,
//     LoginStatus? status,
//   }) {
//     return LoginState(
//       errorMessage: errorMessage ?? this.errorMessage,
//       status: status ?? this.status,
//     );
//   }
//
//   @override
//   List<Object?> get props => [errorMessage, status];
// }
