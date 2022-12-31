import 'package:flutter_test/flutter_test.dart';
import 'package:quotes/core/data/models/quote_response_dto.dart';

void main() {
  group('Testing Quote Response DTO', () {
    var quoteResponseJson = {
      'uuid': '139e8df7-1f4e-457d-b140-f60615eb4483',
      'title': 'A random quote',
      'description': 'This is the best quote ever',
      'author': 'John Doe',
      'created_at': '2022-12-20T13:23:31.226Z',
      'updated_at': '2022-12-30T13:23:31.226Z',
    };

    test('fromJson should transform Map into QuoteResponseDTO', () {
      final result = QuoteResponseDTO.fromJson(quoteResponseJson);
      expect('139e8df7-1f4e-457d-b140-f60615eb4483', result.uuid);
      expect('A random quote', result.title);
      expect('This is the best quote ever', result.description);
      expect('John Doe', result.author);
      expect('2022-12-20T13:23:31.226Z', result.createdAt);
      expect('2022-12-30T13:23:31.226Z', result.updatedAt);
    });

    test('toJson should transform QuoteResponseDTO into Map', () {
      final quoteResponseDTO = QuoteResponseDTO(
        '139e8df7-1f4e-457d-b140-f60615eb4483',
        'A random quote',
        'This is the best quote ever',
        'John Doe',
        '2022-12-20T13:23:31.226Z',
        '2022-12-30T13:23:31.226Z',
      );

      final result = quoteResponseDTO.toJson();
      expect(quoteResponseJson, result);
    });
  });
}
