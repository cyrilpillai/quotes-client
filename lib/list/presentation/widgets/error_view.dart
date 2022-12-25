import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quote_list_bloc.dart';
import '../bloc/quote_list_event.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(message.substring(0, 200)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          OutlinedButton(
              onPressed: () {
                context.read<QuoteListBloc>().add(RefreshClicked());
              },
              child: const Text('Retry'))
        ],
      ),
    );
  }
}
