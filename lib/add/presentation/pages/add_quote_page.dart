import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/models/form_status.dart';
import '../../../core/presentation/widgets/app_bar.dart';
import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../core/presentation/widgets/error_view.dart';
import '../../../core/presentation/widgets/success_view.dart';
import '../../../di/setup.dart';
import '../../../utils/constants.dart';
import '../bloc/add_quote_bloc.dart';
import '../bloc/add_quote_event.dart';
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
        appBar: getAppBar(title: 'Add Quote'),
        body: Content(formKey: _formKey),
        floatingActionButton: SaveButton(formKey: _formKey),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const Content({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddQuoteBloc, AddQuoteState>(
      builder: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is InitialForm) {
          return AddQuoteFormView(formKey: formKey);
        } else if (formStatus is FormSubmitting) {
          return const CircularLoadingView();
        } else if (formStatus is SubmissionSuccess) {
          return SuccessView(
            title: 'Quote was added successfully!',
            description:
                'Do you want to add more quotes or are you done for now?',
            primaryButtonCta: 'Add more',
            secondaryButtonCta: 'Done for now',
            onPrimaryButtonPressed: () =>
                context.read<AddQuoteBloc>().add(AddMoreClicked()),
            onSecondaryButtonPressed: () => context.pop(),
          );
        } else if (formStatus is SubmissionFailed) {
          return ErrorView(
            title: genericErrorTitle,
            description: formStatus.message.substring(0, 200),
          );
        }
        return Container();
      },
    );
  }
}
