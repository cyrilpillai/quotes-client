import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/detail_page_route.dart';
import '../../../routers/parameters.dart';
import '../bloc/random_quote_bloc.dart';
import '../bloc/random_quote_state.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteBloc, RandomQuoteState>(
      builder: (context, state) {
        if (state is Success) {
          return IconButton(
            icon: const Icon(
              Icons.info_outline,
            ),
            onPressed: () {
              context.pushNamed(detailRoute, params: {
                quoteIdParam: state.quote.uuid,
              });
            },
          );
        }
        return Container();
      },
    );
  }
}
