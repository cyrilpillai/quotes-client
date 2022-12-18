// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteDTO _$QuoteDTOFromJson(Map<String, dynamic> json) {
  return QuoteDTO(
    json['uuid'] as String,
    json['title'] as String,
    json['description'] as String? ?? '',
    json['author'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
  );
}

Map<String, dynamic> _$QuoteDTOToJson(QuoteDTO instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
