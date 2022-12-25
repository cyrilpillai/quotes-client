import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/circular_loading_view.dart';
import '../../../di/setup.dart';
import '../../../list/presentation/widgets/error_view.dart';
import '../../widgets/pie_chart_view.dart';
import '../bloc/quote_chart_bloc.dart';
import '../bloc/quote_chart_event.dart';
import '../bloc/quote_chart_state.dart';

class QuoteChartPage extends StatelessWidget {
  const QuoteChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<QuoteChartBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Statistics'),
        ),
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
          return ErrorView(message: state.message);
        }
        return const SizedBox();
      },
    );
  }
}
