import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../di/setup.dart';
import '../../../list/presentation/widgets/error_view.dart';
import '../bloc/random_quote_bloc.dart';
import '../bloc/random_quote_event.dart';
import '../bloc/random_quote_state.dart';
import '../widgets/info_button.dart';
import '../widgets/randomize_button.dart';

class RandomQuotePage extends StatelessWidget {
  const RandomQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<RandomQuoteBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Random Quote'),
          actions: const [InfoButton()],
        ),
        body: const Content(),
        floatingActionButton: const RandomizeButton(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteBloc, RandomQuoteState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<RandomQuoteBloc>().add(Initial());
        } else if (state is Loading) {
          return const CircularLoadingView();
        } else if (state is Success) {
          return _buildSuccess(state);
        } else if (state is Error) {
          return ErrorView(message: state.message);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildSuccess(Success success) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          success.quote.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
