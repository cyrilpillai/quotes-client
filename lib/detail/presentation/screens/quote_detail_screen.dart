import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../list/presentation/widgets/error_view.dart';
import '../../../routers/router.dart';
import '../bloc/quote_detail_bloc.dart';
import '../bloc/quote_detail_event.dart';
import '../bloc/quote_detail_state.dart';
import '../widgets/edit_button.dart';
import '../widgets/quote_section.dart';

class QuoteDetailScreen extends StatelessWidget {
  final String uuid;

  const QuoteDetailScreen(this.uuid, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 20.0,
          onPressed: () {
            context.goNamed(listRoute);
          },
        ),
      ),
      body: Content(uuid),
      floatingActionButton: const EditButton(),
    );
  }
}

class Content extends StatelessWidget {
  final String uuid;

  const Content(this.uuid, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteDetailBloc, QuoteDetailState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<QuoteDetailBloc>().add(Initial(uuid: uuid));
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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        QuoteSection(
          title: 'Title',
          description: success.quote.title,
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        QuoteSection(
          title: 'Description',
          description: success.quote.description,
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        QuoteSection(
          title: 'Author',
          description: success.quote.author,
        ),
      ],
    );
  }
}
