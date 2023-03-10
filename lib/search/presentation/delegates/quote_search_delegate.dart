import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/setup.dart';
import '../bloc/search_bloc.dart';
import '../widgets/search_result_view.dart';

class QuotesSearchDelegate extends SearchDelegate<List> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          if (query.isNotEmpty) {
            query = '';
          } else {
            _close(context);
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton(onPressed: () {
      _close(context);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<SearchBloc>(),
      child: SearchResultView(query: query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<SearchBloc>(),
      child: SearchResultView(query: query),
    );
  }

  _close(BuildContext context) {
    close(context, List.empty());
  }
}
