import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/router.dart';

class EditButton extends StatelessWidget {
  final String uuid;

  const EditButton(this.uuid, {super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.edit),
      onPressed: () {
        context.goNamed(editRoute, params: {
          quoteIdParam: uuid,
        });
      },
    );
  }
}
