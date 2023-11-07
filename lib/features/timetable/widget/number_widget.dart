import 'package:flutter/material.dart';
import 'package:scheduler/core/const/const_barrel.dart';

class NumberWidget extends StatelessWidget {
  final String text;

  const NumberWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      padding: const EdgeInsets.all(4),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.regular16.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
