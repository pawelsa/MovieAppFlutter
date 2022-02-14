// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiCredits _$$_ApiCreditsFromJson(Map<String, dynamic> json) =>
    _$_ApiCredits(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>)
          .map((e) =>
              const ApiPersonConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) =>
              const ApiPersonConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ApiCreditsToJson(_$_ApiCredits instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast.map(const ApiPersonConverter().toJson).toList(),
      'crew': instance.crew.map(const ApiPersonConverter().toJson).toList(),
    };

_$_ApiPerson _$$_ApiPersonFromJson(Map<String, dynamic> json) => _$_ApiPerson(
      id: json['id'] as int,
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String?,
      order: json['order'] as int?,
      department: json['department'] as String?,
      job: json['job'] as String?,
      creditId: json['credit_id'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ApiPersonToJson(_$_ApiPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'order': instance.order,
      'department': instance.department,
      'job': instance.job,
      'credit_id': instance.creditId,
      'runtimeType': instance.$type,
    };

_$_ApiPersonEmpty _$$_ApiPersonEmptyFromJson(Map<String, dynamic> json) =>
    _$_ApiPersonEmpty(
      json['id'] as int? ?? -1,
      json['name'] as String? ?? "Unknown",
      json['profile_path'] as String? ?? null,
      json['character'] as String? ?? null,
      json['order'] as int? ?? -1,
      json['department'] as String? ?? null,
      json['job'] as String? ?? null,
      json['credit_id'] as String? ?? "",
      json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ApiPersonEmptyToJson(_$_ApiPersonEmpty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'order': instance.order,
      'department': instance.department,
      'job': instance.job,
      'credit_id': instance.creditId,
      'runtimeType': instance.$type,
    };
