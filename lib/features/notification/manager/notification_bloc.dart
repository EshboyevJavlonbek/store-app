import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/notification_repository.dart';
import 'package:store_app/features/notification/manager/notification_state.dart';

part 'notification_events.dart';

class NotificationBloc extends Bloc<NotificationEvents, NotificationState>{
  NotificationBloc({required NotificationRepository repo}):_repo = repo, super(NotificationState.initial()){
    on<NotificationLoad>(_onLoad);
    add(NotificationLoad());
  }

  final NotificationRepository _repo;

  Future<void> _onLoad(NotificationLoad event, Emitter<NotificationState> emit)async{
    emit(state.copyWith(notifications: [], status: NotificationStatus.loading));
    try{
      final notifications = await _repo.getNotification();
      emit(state.copyWith(notifications: notifications, status: NotificationStatus.success));
    }catch(e){
      emit(state.copyWith(notifications: [], status: NotificationStatus.error));
    }
  }
}