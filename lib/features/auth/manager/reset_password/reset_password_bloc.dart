import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/manager/reset_password/reset_password_state.dart';

import '../../../../data/repository/auth_repository.dart';

part 'reset_password_events.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository _repo;

  ResetPasswordBloc(this._repo) : super(ResetPasswordState.initial()) {
    on<ResetPasswordRequest>(_onResetPasswordRequested);
  }

  Future<void> _onResetPasswordRequested(
      ResetPasswordRequest event, Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordState.loading());

    final success = await _repo.resetPassword(
      email: event.email,
      code: event.code,
      password: event.password,
    );

    if (success) {
      emit(ResetPasswordState.success());
    } else {
      emit(ResetPasswordState.error("Parolni tiklashda xatolik yuz berdi."));
    }
  }
}
