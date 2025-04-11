import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/manager/verification/verification_state.dart';

import '../../../../data/repository/auth_repository.dart';

part 'verification_events.dart';

class VerificationBloc extends Bloc<VerificationEvents, VerificationState> {
  final AuthRepository _repo;
  static final pinController = TextEditingController();

  static final formKey = GlobalKey<FormState>();

  VerificationBloc(this._repo) : super(VerificationState.initial()) {
    on<VerificationRequested>(_onEnterCodeRequested);
  }

  Future<void> _onEnterCodeRequested(VerificationRequested event, Emitter<VerificationState> emit) async {
    emit(VerificationState.loading());
    try {
      final success = await _repo.forgotPassword(event.email);

      if (success) {
        emit(VerificationState.success());
      } else {
        emit(VerificationState.error("Kod xato!"));
      }
    } catch (e) {
      emit(VerificationState.error(e.toString()));
    }
  }
}
