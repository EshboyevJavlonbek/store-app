import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';
part 'notification_model.freezed.dart';
part'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel implements IJsonSerializable{
  const factory NotificationModel({
    required int id,
    required String icon,
    required String title,
    required String content,
    required String date,
  })=_NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>_$NotificationModelFromJson(json);
}
