import 'package:flutter_test/flutter_test.dart';
import 'package:quotes/core/data/models/quote_request_dto.dart';

void main() {
  group('Testing Quote Request DTO', () {
    var quoteRequestJson = {
      'title': 'A random quote',
      'description': 'This is the best quote ever',
      'author': 'John Doe',
    };

    test('fromJson should transform Map into QuoteRequestDTO', () {
      final result = QuoteRequestDTO.fromJson(quoteRequestJson);
      expect('A random quote', result.title);
      expect('This is the best quote ever', result.description);
      expect('John Doe', result.author);
    });

    test('toJson should transform QuoteRequestDTO into Map', () {
      final quoteRequestDTO = QuoteRequestDTO(
        'A random quote',
        'This is the best quote ever',
        'John Doe',
      );

      final result = quoteRequestDTO.toJson();
      expect(quoteRequestJson, result);
    });
  });
}
