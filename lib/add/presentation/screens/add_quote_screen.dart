import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../list/presentation/widgets/error_view.dart';
import '../../../routers/router.dart';
import '../bloc/add_quote_bloc.dart';
import '../bloc/add_quote_event.dart';
import '../bloc/add_quote_state.dart';
import '../widgets/quote_form_view.dart';
import '../widgets/save_button.dart';

class AddQuoteScreen extends StatelessWidget {
  const AddQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Quote'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 20.0,
          onPressed: () {
            context.goNamed(listRoute);
          },
        ),
      ),
      body: const Content(),
      floatingActionButton: const SaveButton(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddQuoteBloc, AddQuoteState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<AddQuoteBloc>().add(Initial());
        } else if (state is Loading) {
          return const CircularLoadingView();
        } else if (state is Success) {
          return const QuoteFormView();
        } else if (state is Error) {
          return ErrorView(message: state.message);
        }
        return const SizedBox();
      },
    );
  }
}
