import 'package:json_annotation/json_annotation.dart';

part 'quote_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class QuoteDTO {
  final String uuid;
  final String title;
  @JsonKey(defaultValue: '')
  final String description;
  final String author;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  QuoteDTO(
    this.uuid,
    this.title,
    this.description,
    this.author,
    this.createdAt,
    this.updatedAt,
  );

  factory QuoteDTO.fromJson(Map<String, dynamic> json) =>
      _$QuoteDTOFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteDTOToJson(this);
}
