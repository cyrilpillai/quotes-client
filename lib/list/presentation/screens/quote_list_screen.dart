import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/setup.dart';
import '../bloc/quote_list_bloc.dart';
import '../bloc/quote_list_event.dart';
import '../bloc/quote_list_state.dart';
import '../widgets/quote_card.dart';

class QuoteListScreen extends StatelessWidget {
  const QuoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => injector<QuoteListBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quotes'),
            actions: const <Widget>[RefreshButton()],
          ),
          body: const Content(),
          floatingActionButton: const AddButton(),
        ));
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
    return ListView.separated(
      itemCount: success.quotes.length,
      itemBuilder: (_, index) => QuoteCard(
        quoteItem: success.quotes[index],
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }

  Widget _buildError(Error error) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(error.message),
    );
  }
}

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      onPressed: () {
        context.read<QuoteListBloc>().add(RefreshClicked());
      },
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => {
        //Open Add screen
      },
    );
  }
}
