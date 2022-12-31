import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../detail/presentation/pages/quote_detail_page.dart';
import 'page_builder.dart';
import 'parameters.dart';

const detailRoute = '/details';

GoRoute getDetailPageRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) {
  return GoRoute(
    name: detailRoute,
    path: '$detailRoute/:$quoteIdParam',
    parentNavigatorKey: parentNavigatorKey,
    pageBuilder: (BuildContext context, GoRouterState state) {
      final uuid = state.params[quoteIdParam] ?? '';
      return createPage(state, QuoteDetailPage(uuid));
    },
  );
}
