import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/notification_model.dart';

enum NotificationStatus { idle, loading, error, success }

class NotificationState extends Equatable {
  final List<NotificationModel> notifications;
  final NotificationStatus status;

  const NotificationState({
    required this.notifications,
    required this.status,
  });

  factory NotificationState.initial() {
    return NotificationState(
      notifications: [],
      status: NotificationStatus.idle,
    );
  }

  NotificationState copyWith(
      { List<NotificationModel>? notifications,
      NotificationStatus? status}) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [notifications, status];
}
