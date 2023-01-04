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
        appBar: getAppBar(title: 'Edit Quote'),
        body: Content(uuid: uuid, formKey: _formKey),
        floatingActionButton: SaveButton(formKey: _formKey),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String uuid;
  final GlobalKey<FormState> formKey;

  const Content({super.key, required this.uuid, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditQuoteBloc, EditQuoteState>(
      builder: (context, state) {
        //Set UUID if not already set
        if (state.uuid.isEmpty) {
          context.read<EditQuoteBloc>().add(Initial(uuid: uuid));
        }

        final formStatus = state.formStatus;
        if (formStatus is InitialForm) {
          return EditQuoteFormView(formKey: formKey);
        } else if (formStatus is FormSubmitting) {
          return const CircularLoadingView();
        } else if (formStatus is SubmissionSuccess) {
          return SuccessView(
            title: 'Quote was updated successfully!',
            description:
                'Do you want to make more changes or are you done for now?',
            primaryButtonCta: 'Make changes',
            secondaryButtonCta: 'Done for now',
            onPrimaryButtonPressed: () =>
                context.read<EditQuoteBloc>().add(EditMoreClicked(uuid: uuid)),
            onSecondaryButtonPressed: () => context.pop(),
          );
        } else if (formStatus is SubmissionFailed) {
          return ErrorView(
            title: genericErrorTitle,
            description: formStatus.message,
          );
        }
        return Container();
      },
    );
  }
}
