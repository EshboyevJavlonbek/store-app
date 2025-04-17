import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/notification_model.dart';

class NotificationRepository{
  final ApiClient client;

  NotificationRepository({required this.client});

  List<NotificationModel> notifications = [];

  Future<List<NotificationModel>> getNotification()async{
    var rawNotification  = await client.genericGetRequest<List<dynamic>>('');
    notifications = rawNotification.map((notification) => NotificationModel.fromJson(notification)).toList();
    return notifications;
  }
}