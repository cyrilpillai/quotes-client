import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const HomeButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: Colors.blue,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
