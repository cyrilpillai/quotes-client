import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/models/form_status.dart';
import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../di/setup.dart';
import '../../../utils/snackbar.dart';
import '../bloc/edit_quote_bloc.dart';
import '../bloc/edit_quote_event.dart';
import '../bloc/edit_quote_state.dart';
import '../widgets/edit_quote_form_view.dart';
import '../widgets/save_button.dart';

class EditQuotePage extends StatelessWidget {
  final String uuid;
  final _formKey = GlobalKey<FormState>();

  EditQuotePage(this.uuid, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<EditQuoteBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Quote'),
        ),
        body: BlocListener<EditQuoteBloc, EditQuoteState>(
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus is SubmissionFailed) {
              showSnackBar(context, formStatus.message.substring(0, 50));
            } else if (formStatus is SubmissionSuccess) {
              showSnackBar(context, 'Quote edited successfully');
            }
          },
          child: BlocBuilder<EditQuoteBloc, EditQuoteState>(
            builder: (context, state) {
              //Set UUID if not already set
              if (state.uuid.isEmpty) {
                context.read<EditQuoteBloc>().add(Initial(uuid: uuid));
              }

              if (state.formStatus is FormSubmitting) {
                return const CircularLoadingView();
              } else {
                return EditQuoteFormView(formKey: _formKey);
              }
            },
          ),
        ),
        floatingActionButton: SaveButton(formKey: _formKey),
      ),
    );
  }
}
