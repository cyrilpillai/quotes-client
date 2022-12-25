import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/edit_page_route.dart';
import '../../../routers/parameters.dart';

class EditButton extends StatelessWidget {
  final String uuid;

  const EditButton(this.uuid, {super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.edit),
      onPressed: () {
        context.pushNamed(editRoute, params: {
          quoteIdParam: uuid,
        });
      },
    );
  }
}
