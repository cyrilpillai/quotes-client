import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/add_page_route.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => context.pushNamed(addRoute),
    );
  }
}
