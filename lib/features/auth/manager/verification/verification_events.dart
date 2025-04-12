part of'verification_bloc.dart';
sealed class VerificationEvents{}

class VerificationRequested extends VerificationEvents{

  final String email,code;

  VerificationRequested({required this.email, required this.code, });
}