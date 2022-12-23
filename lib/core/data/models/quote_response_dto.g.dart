// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteResponseDTO _$QuoteResponseDTOFromJson(Map<String, dynamic> json) {
  return QuoteResponseDTO(
    json['uuid'] as String,
    json['title'] as String,
    json['description'] as String? ?? '',
    json['author'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
  );
}

Map<String, dynamic> _$QuoteResponseDTOToJson(QuoteResponseDTO instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
