import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetryPressed;

  const ErrorView({
    super.key,
    required this.message,
    this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(message.substring(0, 200)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          _buildRetryButton(),
        ],
      ),
    );
  }

  Widget _buildRetryButton() {
    if (onRetryPressed != null) {
      return OutlinedButton(
        onPressed: onRetryPressed,
        child: const Text('Retry'),
      );
    } else {
      return Container();
    }
  }
}
