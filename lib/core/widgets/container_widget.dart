// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../const/const_barrel.dart';

class ContainerWidget extends StatelessWidget {
  final String title;
  final String svg;
  final String details;
  final Color color;
  final Color borderColor;
  final VoidCallback onPressed;

  const ContainerWidget({
    super.key,
    required this.title,
    required this.details,
    required this.svg,
    required this.color,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 169,
        height: 100,
        padding: const EdgeInsets.only(
          top: 8,
          left: 12,
          right: 12,
          bottom: 20,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: borderColor,
            ),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.regular16
                        .copyWith(color: Colors.black, fontSize: 14),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    svg,
                    width: 25.17,
                    height: 20,
                    color: color,
                  ),
                ],
              ),
            ),
            const Gap(10),
            SizedBox(
              // width: 139,
              child: Text(
                maxLines: 3,
                textAlign: TextAlign.left,
                details,
                style: AppTextStyles.regular12.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget2 extends StatelessWidget {
  final String title;
  final String svg;

  final VoidCallback onPressed;

  const ContainerWidget2({
    super.key,
    required this.title,
    required this.svg,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 176,
        height: 69,
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 12,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(4),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26055FE0),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svg,
              width: 25.17,
              height: 20,
              color: Colors.black,
            ),
            const Gap(8),
            SizedBox(
              // width: 139,
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: AppTextStyles.regular12.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
