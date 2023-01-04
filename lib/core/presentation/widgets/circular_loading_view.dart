import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CircularLoadingView extends StatelessWidget {
  const CircularLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.newtonCradle(
        color: Theme.of(context).colorScheme.secondary,
        size: 200,
      ),
    );
  }
}
