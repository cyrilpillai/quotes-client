import '../../domain/entities/quote_entity.dart';

class QuoteItem {
  final String title;
  final String description;
  final String author;

  QuoteItem({
    required this.title,
    required this.description,
    required this.author,
  });

  factory QuoteItem.fromEntity(QuoteEntity quoteEntity) {
    return QuoteItem(
      title: quoteEntity.title,
      description: quoteEntity.description,
      author: quoteEntity.author,
    );
  }
}
