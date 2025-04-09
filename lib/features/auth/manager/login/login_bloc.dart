import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import 'login_state.dart';
import '../../../../data/repository/auth_repository.dart';

part 'login_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repo;

  LoginBloc({required AuthRepository repo})
      : _repo = repo,
        super(LoginState.initial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginState.loading());

    try {
      final success = await _repo.login(event.email, event.password);

      if (success) {
        emit(LoginState.success());
      } else {
        emit(LoginState.error("Login failed. Please try again."));
      }
    } catch (e) {
      emit(LoginState.error("Something went wrong: ${e.toString()}"));
    }
  }

  bool? emailValid, passwordValid;

  Color getBackgroundColor(){
    if (emailValid == null || passwordValid == null) {
      return AppColors.greySub;
    }
    if (!emailValid! || !passwordValid!) {
      return AppColors.greySub;
    }
    return AppColors.blackMain;
  }
}
