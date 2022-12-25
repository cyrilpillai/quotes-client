import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  final String title;
  final String description;

  const QuoteSection(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        )
      ],
    );
  }
}
