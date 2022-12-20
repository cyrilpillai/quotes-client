import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/detail/presentation/widgets/quote_section.dart';
import 'package:quotes/routers/router.dart';

import '../../../di/setup.dart';
import '../bloc/quote_detail_bloc.dart';
import '../bloc/quote_detail_event.dart';
import '../bloc/quote_detail_state.dart';

class QuoteDetailScreen extends StatelessWidget {
  final String uuid;

  const QuoteDetailScreen(this.uuid, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => injector<QuoteDetailBloc>(),
        child: Scaffold(
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
          floatingActionButton: const ActionButton(),
        ));
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
          return _buildLoading();
        } else if (state is Success) {
          return _buildSuccess(state);
        } else if (state is Error) {
          return _buildError(state);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
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

  Widget _buildError(Error error) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(error.message),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.edit),
      onPressed: () => context.read<QuoteDetailBloc>().add(BackClicked()),
    );
  }
}
