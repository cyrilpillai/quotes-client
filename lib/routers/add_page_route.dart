import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../add/presentation/pages/add_quote_page.dart';
import 'page_builder.dart';

const addRoute = 'add';

GoRoute getAddPageRoute() {
  return GoRoute(
    name: addRoute,
    path: 'add',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        createPage(state, AddQuotePage()),
  );
}
