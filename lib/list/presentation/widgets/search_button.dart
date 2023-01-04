import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/presentation/delegates/quote_search_delegate.dart';
import '../bloc/quote_list_bloc.dart';
import '../bloc/quote_list_state.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteListBloc, QuoteListState>(
      builder: (context, state) {
        if (state is Success) {
          return IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(context: context, delegate: QuotesSearchDelegate());
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
