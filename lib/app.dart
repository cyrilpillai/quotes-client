import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'add/presentation/bloc/add_quote_bloc.dart';
import 'detail/presentation/bloc/quote_detail_bloc.dart';
import 'di/setup.dart';
import 'list/presentation/bloc/quote_list_bloc.dart';
import 'routers/router.dart';
import 'search/presentation/bloc/search_bloc.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter router = getRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injector<QuoteListBloc>()),
        BlocProvider(create: (_) => injector<SearchBloc>()),
        BlocProvider(create: (_) => injector<AddQuoteBloc>()),
        BlocProvider(create: (_) => injector<QuoteDetailBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Quotes',
        theme: ThemeData(primarySwatch: Colors.blue),
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
