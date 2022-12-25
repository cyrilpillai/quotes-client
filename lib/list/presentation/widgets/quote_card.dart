import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/models/quote_item.dart';
import '../../../routers/detail_page_route.dart';
import '../../../routers/parameters.dart';

class QuoteCard extends StatelessWidget {
  final QuoteItem quoteItem;

  const QuoteCard({super.key, required this.quoteItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(detailRoute, params: {
          quoteIdParam: quoteItem.uuid,
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quoteItem.title,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text(
              quoteItem.author,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
