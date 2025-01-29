// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      activity: json['activity'] as String,
      type: json['type'] as String,
      accessibility: (json['accessibility'] as num).toDouble(),
      participants: (json['participants'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      key: json['key'] as String,
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'type': instance.type,
      'accessibility': instance.accessibility,
      'participants': instance.participants,
      'price': instance.price,
      'key': instance.key,
    };
