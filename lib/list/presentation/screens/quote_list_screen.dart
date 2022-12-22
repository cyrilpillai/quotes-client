import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../di/setup.dart';
import '../../../search/presentation/bloc/search_bloc.dart';
import '../widgets/error_view.dart';
import '../bloc/quote_list_bloc.dart';
import '../bloc/quote_list_event.dart';
import '../bloc/quote_list_state.dart';
import '../widgets/add_button.dart';
import '../widgets/quotes_list_view.dart';
import '../widgets/search_button.dart';

class QuoteListScreen extends StatelessWidget {
  const QuoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<QuoteListBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quotes'),
          actions: const [SearchButton()],
        ),
        body: const Content(),
        floatingActionButton: const AddButton(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteListBloc, QuoteListState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<QuoteListBloc>().add(Initial());
        } else if (state is Loading) {
          return const CircularLoadingView();
        } else if (state is Success) {
          return QuotesListView(
            quotes: state.quotes,
            shouldShowRefresh: true,
          );
        } else if (state is Error) {
          return ErrorView(message: state.message);
        }
        return Container();
      },
    );
  }
}
