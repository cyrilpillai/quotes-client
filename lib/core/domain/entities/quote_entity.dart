import '../../data/models/quote_response_dto.dart';

class QuoteEntity {
  final String uuid;
  final String title;
  final String description;
  final String author;
  final String createdAt;
  final String updatedAt;

  const QuoteEntity({
    required this.uuid,
    required this.title,
    required this.description,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
  });

  factory QuoteEntity.fromModel(QuoteResponseDTO quoteDTO) => QuoteEntity(
        uuid: quoteDTO.uuid,
        title: quoteDTO.title,
        description: quoteDTO.description,
        author: quoteDTO.author,
        createdAt: quoteDTO.createdAt,
        updatedAt: quoteDTO.updatedAt,
      );
}
