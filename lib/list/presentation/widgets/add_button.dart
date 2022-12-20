import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/router.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => context.goNamed(addRoute),
    );
  }
}
