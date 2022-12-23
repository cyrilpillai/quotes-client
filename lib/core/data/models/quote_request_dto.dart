import 'package:json_annotation/json_annotation.dart';

part 'quote_request_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class QuoteRequestDTO {
  final String title;
  @JsonKey(includeIfNull: false)
  final String? description;
  final String author;

  QuoteRequestDTO(
    this.title,
    this.description,
    this.author,
  );

  factory QuoteRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$QuoteRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteRequestDTOToJson(this);
}
