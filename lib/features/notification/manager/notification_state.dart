import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/notification/notification_model.dart';
part 'notification_state.freezed.dart';

enum NotificationStatus { idle, loading, error, success }

@freezed
abstract class NotificationState with _$NotificationState{
  const factory NotificationState({
    required List<NotificationModel> notifications,
    required NotificationStatus status,
  })=_NotificationState;

  factory NotificationState.initial() {
    return NotificationState(
      notifications: [],
      status: NotificationStatus.idle,
    );
  }
}
