import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../models/quote_chart_item.dart';

@immutable
abstract class QuoteChartState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends QuoteChartState {}

class Loading extends QuoteChartState {}

class Success extends QuoteChartState {
  final List<QuoteChartItem> chartItems;

  Success({required this.chartItems});
}

class Error extends QuoteChartState {
  final String message;

  Error({required this.message});
}
