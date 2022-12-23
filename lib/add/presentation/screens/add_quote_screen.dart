import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/utils/snackbar.dart';

import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../di/setup.dart';
import '../../../routers/router.dart';
import '../bloc/add_quote_bloc.dart';
import '../bloc/add_quote_state.dart';
import '../bloc/form_status.dart';
import '../widgets/quote_form_view.dart';
import '../widgets/save_button.dart';

class AddQuoteScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<AddQuoteBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Quote'),
          leading: BackButton(
            onPressed: () {
              context.goNamed(listRoute);
            },
          ),
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
                return QuoteFormView(formKey: _formKey);
              }
            },
          ),
        ),
        floatingActionButton: SaveButton(formKey: _formKey),
      ),
    );
  }
}
