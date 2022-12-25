import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../detail/presentation/pages/quote_detail_page.dart';
import 'edit_page_route.dart';
import 'page_builder.dart';
import 'parameters.dart';

const detailRoute = 'details';

GoRoute getDetailPageRoute() {
  return GoRoute(
    name: detailRoute,
    path: 'details/:$quoteIdParam',
    pageBuilder: (BuildContext context, GoRouterState state) {
      final uuid = state.params[quoteIdParam] ?? '';
      return createPage(state, QuoteDetailPage(uuid));
    },
    routes: [getEditPageRoute()],
  );
}
