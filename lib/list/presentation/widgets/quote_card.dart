import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/models/quote_item.dart';
import '../../../routers/router.dart';

class QuoteCard extends StatelessWidget {
  final QuoteItem quoteItem;

  const QuoteCard({super.key, required this.quoteItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(detailRoute, params: {
          quoteIdParam: quoteItem.uuid,
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quoteItem.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Text(
              quoteItem.author,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
