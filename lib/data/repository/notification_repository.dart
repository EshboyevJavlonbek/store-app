import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/notification/notification_model.dart';

class NotificationRepository {
  final ApiClient client;

  NotificationRepository({required this.client});
  List<NotificationModel> notifications = [];

  Future<List<NotificationModel>> getNotification() async {
      final response = await client.genericGetRequest<List<dynamic>>('/notifications/list');
       notifications = response.map((item) => NotificationModel.fromJson(item)).toList();
      return notifications;
  }
}
