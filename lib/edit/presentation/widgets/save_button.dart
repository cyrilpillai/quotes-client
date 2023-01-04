import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/models/form_status.dart';
import '../bloc/edit_quote_bloc.dart';
import '../bloc/edit_quote_event.dart';
import '../bloc/edit_quote_state.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SaveButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditQuoteBloc, EditQuoteState>(
      builder: (context, state) {
        if (state.formStatus is InitialForm) {
          return FloatingActionButton(
            child: const Icon(Icons.done),
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                context.read<EditQuoteBloc>().add(SaveClicked());
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
