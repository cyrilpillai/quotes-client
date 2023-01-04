import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/app_bar.dart';
import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../core/presentation/widgets/error_view.dart';
import '../../../di/setup.dart';
import '../../../utils/constants.dart';
import '../bloc/quote_chart_bloc.dart';
import '../bloc/quote_chart_event.dart';
import '../bloc/quote_chart_state.dart';
import '../widgets/pie_chart_view.dart';

class QuoteChartPage extends StatelessWidget {
  const QuoteChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<QuoteChartBloc>(),
      child: Scaffold(
        appBar: getAppBar(showThemeChanger: true),
        body: const Content(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteChartBloc, QuoteChartState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<QuoteChartBloc>().add(Initial());
        } else if (state is Loading) {
          return const CircularLoadingView();
        } else if (state is Success) {
          return PieChartView(chartItems: state.chartItems);
        } else if (state is Error) {
          return ErrorView(
            title: genericErrorTitle,
            description: state.message.substring(0, 200),
            primaryButtonCta: 'Retry',
            onPrimaryButtonPressed: () =>
                context.read<QuoteChartBloc>().add(RefreshClicked()),
          );
        }
        return Container();
      },
    );
  }
}
