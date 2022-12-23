import 'package:json_annotation/json_annotation.dart';

part 'quote_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class QuoteResponseDTO {
  final String uuid;
  final String title;
  @JsonKey(defaultValue: '')
  final String description;
  final String author;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  QuoteResponseDTO(
    this.uuid,
    this.title,
    this.description,
    this.author,
    this.createdAt,
    this.updatedAt,
  );

  factory QuoteResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteResponseDTOToJson(this);
}
