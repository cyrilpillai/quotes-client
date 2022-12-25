import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/quote_chart_usecase.dart';
import '../models/quote_chart_item.dart';
import 'quote_chart_event.dart';
import 'quote_chart_state.dart';

@injectable
class QuoteChartBloc extends Bloc<QuoteChartEvent, QuoteChartState> {
  final QuoteChartUseCase _quoteChartUseCase;

  QuoteChartBloc(this._quoteChartUseCase) : super(Empty()) {
    on<Initial>((event, emit) => _fetchChartItems(event, emit));
    on<RefreshClicked>((event, emit) => _fetchChartItems(event, emit));
  }

  void _fetchChartItems(
    QuoteChartEvent event,
    Emitter<QuoteChartState> emit,
  ) async {
    emit(Loading());
    final chartData =
        await _quoteChartUseCase.fetchChartData().catchError((error) {
      emit(Error(message: error.toString()));
    });

    final List<QuoteChartItem> chartItems = List.empty(growable: true);
    final colors = [
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.brown,
      Colors.pink,
      Colors.deepPurple,
      Colors.blueGrey,
    ];
    for (var i = 0; i < chartData.length; i++) {
      final data = chartData[i];
      final color = (i < colors.length) ? colors[i] : Colors.black;
      chartItems.add(QuoteChartItem(
        index: i,
        author: data.author,
        percent: data.percent,
        displayablePercent: '${data.percent.toStringAsFixed(1)}%',
        color: color,
      ));
    }
    emit(Success(chartItems: chartItems));
  }
}
