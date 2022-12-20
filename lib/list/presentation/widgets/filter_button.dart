import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
      onPressed: () {
        //Add filter logic
      },
    );
  }
}
