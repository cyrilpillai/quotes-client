import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../random/presentation/pages/random_quote_page.dart';
import 'page_builder.dart';

const randomRoute = '/random';

GoRoute getRandomQuotePageRoute() {
  return GoRoute(
    name: randomRoute,
    path: randomRoute,
    pageBuilder: (BuildContext context, GoRouterState state) => createPage(
      state,
      const RandomQuotePage(),
      pageAnimation: PageAnimation.fade,
    ),
  );
}
