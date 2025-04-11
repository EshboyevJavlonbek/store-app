import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repository/auth_repository.dart';
import 'forgot_password_state.dart';

part 'forgot_password_events.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository _repo;

  ForgotPasswordBloc(this._repo) : super(ForgotPasswordState.initial()) {
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onForgotPasswordRequested(ForgotPasswordRequested event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordState.loading());
    try {
      final success = await _repo.forgotPassword(event.email);

      if (success) {
        emit(ForgotPasswordState.success());
      } else {
        emit(ForgotPasswordState.error("xatoooo"));
      }
    } catch (e) {
      emit(ForgotPasswordState.error(e.toString()));
    }
  }
}
