import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants.dart';

class SuccessView extends StatelessWidget {
  final String? title;
  final String? description;
  final String? primaryButtonCta;
  final VoidCallback? onPrimaryButtonPressed;
  final String? secondaryButtonCta;
  final VoidCallback? onSecondaryButtonPressed;

  const SuccessView({
    super.key,
    this.title,
    this.description,
    this.primaryButtonCta,
    this.onPrimaryButtonPressed,
    this.secondaryButtonCta,
    this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              '$animationsPrefix/success.json',
              repeat: false,
              width: 250,
              height: 250,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
            _buildTitle(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            _buildDescription(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
            _buildPrimaryButton(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            _buildSecondaryButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    if (title != null) {
      return Text(
        title ?? 'Title goes here',
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildDescription() {
    if (description != null) {
      return Text(
        description ?? 'Description goes here',
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Container();
    }
  }

  Widget _buildPrimaryButton() {
    if (onPrimaryButtonPressed != null) {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPrimaryButtonPressed,
              child: Text(primaryButtonCta ?? 'Primary CTA'),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildSecondaryButton() {
    if (onSecondaryButtonPressed != null) {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onSecondaryButtonPressed,
              child: Text(secondaryButtonCta ?? 'Secondary CTA'),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
