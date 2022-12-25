import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../presentation/models/quote_chart_item.dart';

class PieChartView extends StatefulWidget {
  final List<QuoteChartItem> chartItems;

  const PieChartView({super.key, required this.chartItems});

  @override
  State<PieChartView> createState() => _PieChartViewState();
}

class _PieChartViewState extends State<PieChartView> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLegend(context),
          _buildChart(context),
        ],
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: _buildLegendItems(
              context,
              widget.chartItems.sublist(0, 5),
              1,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: _buildLegendItems(
              context,
              widget.chartItems.sublist(5),
              2,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildLegendItems(
    BuildContext context,
    List<QuoteChartItem> quoteChartItems,
    /*
    Legend is divided into two columns - this field ensures the widget
    grows/shrinks based on a combination of the element index & columnIndex
     */
    int columnIndex,
  ) {
    final List<Widget> widgets = List.empty(growable: true);

    for (int index = 0; index < quoteChartItems.length; index++) {
      widgets.add(_buildLegendItem(
        context,
        columnIndex == 1 ? index : index + 5,
        quoteChartItems[index],
      ));
    }
    return widgets;
  }

  Widget _buildLegendItem(
    BuildContext context,
    int index,
    QuoteChartItem quoteChartItem,
  ) {
    final isTouched = index == touchedIndex;
    final indicatorSize = isTouched ? 24.0 : 16.0;
    final fontSize = isTouched ? 16.0 : 12.0;
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: quoteChartItem.color,
              width: indicatorSize,
              height: indicatorSize,
            ),
            const Padding(padding: EdgeInsets.only(left: 16.0)),
            Expanded(
              child: Text(
                '${quoteChartItem.author} ${quoteChartItem.displayablePercent}',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
      ],
    );
  }

  Widget _buildChart(BuildContext context) {
    return Expanded(
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: widget.chartItems.map((e) {
            final isTouched = e.index == touchedIndex;
            final fontSize = isTouched ? 16.0 : 10.0;
            final radius = isTouched ? 180.0 : 160.0;
            return PieChartSectionData(
                value: e.percent,
                title: e.displayablePercent,
                color: e.color,
                radius: radius,
                titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
