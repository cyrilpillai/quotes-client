import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/add_page_route.dart';
import '../bloc/quote_list_bloc.dart';
import '../bloc/quote_list_state.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteListBloc, QuoteListState>(
      builder: (context, state) {
        if (state is Success) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.push(addRoute);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
