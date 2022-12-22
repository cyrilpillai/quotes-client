import 'package:flutter/material.dart';

import '../../../search/presentation/delegates/quote_search_delegate.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () {
        showSearch(context: context, delegate: QuotesSearchDelegate());
      },
    );
  }
}
