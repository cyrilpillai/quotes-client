import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/add/presentation/bloc/add_quote_bloc.dart';

import '../bloc/add_quote_event.dart';
import '../bloc/add_quote_state.dart';
import 'header_view.dart';

class QuoteFormView extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const QuoteFormView({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const HeaderView(title: 'Author'),
          const Padding(padding: EdgeInsets.only(top: 16)),
          _buildAuthorField(),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const HeaderView(title: 'Title'),
          const Padding(padding: EdgeInsets.only(top: 16)),
          _buildTitleField(),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const HeaderView(title: 'Description'),
          const Padding(padding: EdgeInsets.only(top: 16)),
          _buildDescriptionField()
        ],
      ),
    );
  }

  Widget _buildAuthorField() {
    return BlocBuilder<AddQuoteBloc, AddQuoteState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.author,
          decoration: _getDecoration('Enter author\'s name'),
          validator: (value) =>
              state.isAuthorValid ? null : 'Author\'s name is too short',
          onChanged: (value) =>
              context.read<AddQuoteBloc>().add(AuthorChanged(author: value)),
        );
      },
    );
  }

  Widget _buildTitleField() {
    return BlocBuilder<AddQuoteBloc, AddQuoteState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title,
          decoration: _getDecoration('Enter the quote'),
          validator: (value) =>
              state.isTitleValid ? null : 'Title is too short',
          onChanged: (value) =>
              context.read<AddQuoteBloc>().add(TitleChanged(title: value)),
        );
      },
    );
  }

  Widget _buildDescriptionField() {
    return BlocBuilder<AddQuoteBloc, AddQuoteState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.description,
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: 5,
          decoration: _getDecoration('Enter the description'),
          validator: (value) =>
              state.isDescriptionValid ? null : 'Description is too short',
          onChanged: (value) => context
              .read<AddQuoteBloc>()
              .add(DescriptionChanged(description: value)),
        );
      },
    );
  }

  InputDecoration _getDecoration(String label) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      hintText: label,
    );
  }
}
