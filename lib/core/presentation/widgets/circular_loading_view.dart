import 'package:flutter/material.dart';

class CircularLoadingView extends StatelessWidget {
  const CircularLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
