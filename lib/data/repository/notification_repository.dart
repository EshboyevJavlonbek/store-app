import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/notification_model.dart';

class NotificationRepository {
  final ApiClient client;

  NotificationRepository({required this.client});

  Future<List<NotificationModel>> getNotification() async {
    try {
      final response = await client
          .genericGetRequest<List<dynamic>>('/notifications/list');
      final notifications = response
          .map((item) =>
              NotificationModel.fromJson(item as Map<String, dynamic>))
          .toList();

      return notifications;
    } catch (e) {
      return [];
    }
  }
}
