import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../add/presentation/pages/add_quote_page.dart';
import 'page_builder.dart';

const addRoute = '/add';

GoRoute getAddPageRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) {
  return GoRoute(
    name: addRoute,
    path: addRoute,
    parentNavigatorKey: parentNavigatorKey,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        createPage(state, AddQuotePage()),
  );
}
