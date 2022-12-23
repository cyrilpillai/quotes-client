import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../add/presentation/screens/add_quote_screen.dart';
import '../detail/presentation/screens/quote_detail_screen.dart';
import '../list/presentation/screens/quote_list_screen.dart';

const listRoute = 'list';
const detailRoute = 'details';
const addRoute = 'add';
const quoteIdParam = 'uuid';

GoRouter getRouter() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: listRoute,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const QuoteListScreen();
        },
        routes: [
          GoRoute(
            name: detailRoute,
            path: 'details/:$quoteIdParam',
            builder: (BuildContext context, GoRouterState state) {
              final uuid = state.params[quoteIdParam] ?? '';
              return QuoteDetailScreen(uuid);
            },
          ),
          GoRoute(
            name: addRoute,
            path: 'add',
            builder: (BuildContext context, GoRouterState state) {
              return AddQuoteScreen();
            },
          )
        ],
      ),
    ],
  );
}
