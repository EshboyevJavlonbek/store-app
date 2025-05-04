// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) =>
    _ReviewsModel(
      created: DateTime.parse(json['created'] as String),
      userFullName: json['userFullName'] as String,
      id: (json['id'] as num).toInt(),
      comment: json['comment'] as String,
      rating: json['rating'] as num,
    );

Map<String, dynamic> _$ReviewsModelToJson(_ReviewsModel instance) =>
    <String, dynamic>{
      'created': instance.created.toIso8601String(),
      'userFullName': instance.userFullName,
      'id': instance.id,
      'comment': instance.comment,
      'rating': instance.rating,
    };
