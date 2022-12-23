// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteRequestDTO _$QuoteRequestDTOFromJson(Map<String, dynamic> json) {
  return QuoteRequestDTO(
    json['title'] as String,
    json['description'] as String?,
    json['author'] as String,
  );
}

Map<String, dynamic> _$QuoteRequestDTOToJson(QuoteRequestDTO instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['author'] = instance.author;
  return val;
}
