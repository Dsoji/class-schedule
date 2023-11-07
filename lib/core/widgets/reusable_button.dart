import 'package:flutter/material.dart';

import '../const/const_barrel.dart';

class FullButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const FullButton(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.regular16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class OutlinButton extends StatelessWidget {
  final String text;
  final Color color;

  final double width;
  final double height;
  final VoidCallback onPressed;

  const OutlinButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color)),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.regular16.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}

// class OutlinIconButton extends StatelessWidget {
//   final String text;
//   final Icon icon;
//   final Color color;
//   final Color bgColor;
//   final double width;
//   final double height;
//   final VoidCallback onPressed;

//   const OutlinIconButton(
//       {super.key,
//       required this.text,
//       required this.width,
//       required this.height,
//       required this.onPressed,
//       required this.color,
//       required this.bgColor,
//       required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//             color: bgColor,
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: color)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             icon,
//             const Gap(8),
//             Text(
//               text,
//               style: AppTextStyles.title1.copyWith(
//                   color: color, fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
