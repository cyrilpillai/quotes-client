import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/quote_item.dart';

class QuoteCard extends StatelessWidget {
  final QuoteItem quoteItem;

  const QuoteCard({super.key, required this.quoteItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          /*const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          Text(
            quoteItem.description,
            style: const TextStyle(
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),*/
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
    );
  }
}
