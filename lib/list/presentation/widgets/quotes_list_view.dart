import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/models/quote_item.dart';
import '../bloc/quote_list_bloc.dart';
import '../bloc/quote_list_event.dart';
import 'quote_card.dart';

class QuotesListView extends StatelessWidget {
  final List<QuoteItem> quotes;
  final bool shouldShowRefresh;

  const QuotesListView({
    super.key,
    required this.quotes,
    this.shouldShowRefresh = false,
  });

  @override
  Widget build(BuildContext context) {
    if (shouldShowRefresh) {
      return RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,
        onRefresh: () async {
          context.read<QuoteListBloc>().add(RefreshClicked());
        },
        child: _buildListView(context),
      );
    } else {
      return _buildListView(context);
    }
  }

  Widget _buildListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      itemCount: quotes.length,
      itemBuilder: (_, index) => QuoteCard(
        quoteItem: quotes[index],
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
        );
      },
    );
  }
}
