import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/random_quote_bloc.dart';
import '../bloc/random_quote_event.dart';
import '../bloc/random_quote_state.dart';

class RandomizeButton extends StatelessWidget {
  const RandomizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteBloc, RandomQuoteState>(
      builder: (context, state) {
        if (state is Success) {
          return FloatingActionButton(
            child: const Icon(
              Icons.shuffle,
            ),
            onPressed: () {
              context.read<RandomQuoteBloc>().add(RandomizeClicked());
            },
          );
        }
        return Container();
      },
    );
  }
}
