import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../edit/presentation/pages/edit_quote_page.dart';
import 'page_builder.dart';
import 'parameters.dart';

const editRoute = '/edit';

GoRoute getEditPageRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) {
  return GoRoute(
    name: editRoute,
    path: '$editRoute/:$quoteIdParam',
    parentNavigatorKey: parentNavigatorKey,
    pageBuilder: (BuildContext context, GoRouterState state) {
      final uuid = state.params[quoteIdParam] ?? '';
      return createPage(state, EditQuotePage(uuid));
    },
  );
}
