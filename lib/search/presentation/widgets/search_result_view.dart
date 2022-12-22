import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../list/presentation/widgets/quotes_list_view.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';
import 'search_not_found_view.dart';

class SearchResultView extends StatelessWidget {
  final String query;

  const SearchResultView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    context.read<SearchBloc>().add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is Empty) {
          return Container();
        } else if (state is Loading) {
          return const CircularLoadingView();
        } else if (state is Success) {
          return QuotesListView(quotes: state.quotes);
        } else if (state is NotFound) {
          return const SearchNotFoundView();
        }
        return Container();
      },
    );
  }
}
