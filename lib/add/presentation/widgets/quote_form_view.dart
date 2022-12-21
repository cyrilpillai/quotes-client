import 'package:flutter/material.dart';

import 'header_view.dart';

class QuoteFormView extends StatefulWidget {
  const QuoteFormView({super.key});

  @override
  State<QuoteFormView> createState() => _QuoteFormViewState();
}

class _QuoteFormViewState extends State<QuoteFormView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const HeaderView(title: 'Author'),
        const Padding(padding: EdgeInsets.only(top: 16)),
        TextField(
          decoration: _getDecoration('Enter author\'s name'),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        const HeaderView(title: 'Title'),
        const Padding(padding: EdgeInsets.only(top: 16)),
        TextField(
          decoration: _getDecoration('Enter the quote'),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        const HeaderView(title: 'Description'),
        const Padding(padding: EdgeInsets.only(top: 16)),
        TextField(
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: 5,
          decoration: _getDecoration('Enter the description'),
        ),
      ],
    );
  }

  InputDecoration _getDecoration(String label) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label,
      alignLabelWithHint: true,
    );
  }
}
