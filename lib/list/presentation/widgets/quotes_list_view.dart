import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quote_list_bloc.dart';
import '../bloc/quote_list_event.dart';
import '../bloc/quote_list_state.dart';
import 'quote_card.dart';

class QuotesListView extends StatelessWidget {
  final Success success;

  const QuotesListView({super.key, required this.success});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<QuoteListBloc>().add(RefreshClicked());
      },
      child: ListView.separated(
        itemCount: success.quotes.length,
        itemBuilder: (_, index) =>
            QuoteCard(
              quoteItem: success.quotes[index],
            ),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 1,
          );
        },
      ),
    );
  }
}
