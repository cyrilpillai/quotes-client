import '../../domain/entities/quote_entity.dart';

class QuoteItem {
  final String uuid;
  final String title;
  final String description;
  final String author;

  QuoteItem({
    required this.uuid,
    required this.title,
    required this.description,
    required this.author,
  });

  factory QuoteItem.fromEntity(QuoteEntity quoteEntity) {
    final description = quoteEntity.description.isNotEmpty
        ? quoteEntity.description
        : 'Not available';
    return QuoteItem(
      uuid: quoteEntity.uuid,
      title: quoteEntity.title,
      description: description,
      author: quoteEntity.author,
    );
  }
}
