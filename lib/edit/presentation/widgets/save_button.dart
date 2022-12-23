import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_quote_bloc.dart';
import '../bloc/edit_quote_event.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SaveButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.done),
      onPressed: () {
        if (formKey.currentState?.validate() == true) {
          context.read<EditQuoteBloc>().add(SaveClicked());
        }
      },
    );
  }
}
