import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../list/presentation/pages/quote_list_page.dart';
import 'detail_page_route.dart';
import 'page_builder.dart';

const listRoute = 'list';

GoRoute getListPageRoute() {
  return GoRoute(
    name: listRoute,
    path: '/list',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        createPage(state, const QuoteListPage()),
  );
}
