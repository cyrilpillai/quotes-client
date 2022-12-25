import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/models/form_status.dart';
import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../di/setup.dart';
import '../../../utils/snackbar.dart';
import '../bloc/add_quote_bloc.dart';
import '../bloc/add_quote_state.dart';
import '../widgets/add_quote_form_view.dart';
import '../widgets/save_button.dart';

class AddQuotePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<AddQuoteBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Quote'),
        ),
        body: BlocListener<AddQuoteBloc, AddQuoteState>(
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus is SubmissionFailed) {
              showSnackBar(context, formStatus.message.substring(0, 50));
            } else if (formStatus is SubmissionSuccess) {
              showSnackBar(context, 'Quote added successfully');
            }
          },
          child: BlocBuilder<AddQuoteBloc, AddQuoteState>(
            builder: (context, state) {
              if (state.formStatus is FormSubmitting) {
                return const CircularLoadingView();
              } else {
                return AddQuoteFormView(formKey: _formKey);
              }
            },
          ),
        ),
        floatingActionButton: SaveButton(formKey: _formKey),
      ),
    );
  }
}
