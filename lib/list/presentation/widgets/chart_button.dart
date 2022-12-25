import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routers/chart_page_route.dart';


class ChartButton extends StatelessWidget {
  const ChartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.pie_chart,
        color: Colors.white,
      ),
      onPressed: () {
        context.pushNamed(chartRoute);
      },
    );
  }
}
