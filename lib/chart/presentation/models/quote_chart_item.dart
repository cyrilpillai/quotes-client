import 'dart:ui';

class QuoteChartItem {
  final int index;
  final String author;
  final double percent;
  final String displayablePercent;
  final Color color;

  const QuoteChartItem({
    required this.index,
    required this.author,
    required this.percent,
    required this.displayablePercent,
    required this.color,
  });
}
