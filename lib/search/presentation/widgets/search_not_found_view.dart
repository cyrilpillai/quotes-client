import 'package:flutter/material.dart';

class SearchNotFoundView extends StatelessWidget {
  const SearchNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No quotes found',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
