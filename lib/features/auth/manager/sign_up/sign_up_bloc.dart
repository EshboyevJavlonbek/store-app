import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/manager/sign_up/sign_up_state.dart';

import '../../../../core/utils/colors.dart';
import '../../../../data/repository/auth_repository.dart';

part 'sign_up_events.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _repo;

  SignUpBloc({required AuthRepository repo}) :_repo = repo, super(SignUpState.initial()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<SignUpState> emit) async {
    emit(SignUpState.loading());

    try {
      final success = await _repo.signUp(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      );

      if (success) {
        emit(SignUpState.success());
      } else {
        emit(SignUpState.error("Sign up failed, please try again."));
      }
    } catch (e) {
      emit(SignUpState.error(e.toString()));
    }
  }

  bool? fullNameValid, emailValid, passwordValid;

  Color getBackgroundColor() {
    if (fullNameValid == null || emailValid == null || passwordValid == null) {
      return AppColors.greySub;
    }
    if (!fullNameValid! || !emailValid! || !passwordValid!) {
      return AppColors.greySub;
    }
    return AppColors.blackMain;
  }
}
