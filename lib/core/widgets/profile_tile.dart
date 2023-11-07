// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../const/const_barrel.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String svg;
  final Color color;
  final VoidCallback onTap;

  const ProfileTile({
    super.key,
    required this.title,
    required this.svg,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.65,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svg,
              width: 25.17,
              height: 20,
              color: color,
            ),
            const Gap(20),
            Text(
              title,
              style: AppTextStyles.regular16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile2 extends StatelessWidget {
  final String title;
  final String svg;

  final VoidCallback onTap;

  const ProfileTile2({
    super.key,
    required this.title,
    required this.svg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.65,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              svg,
              width: 25.17,
              height: 20,
            ),
            const Gap(20),
            Text(
              title,
              style: AppTextStyles.regular16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownTile extends StatelessWidget {
  final Widget child;

  const DropdownTile({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 163.50,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.20,
              color: Color(0xBF212121),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Center(child: child));
  }
}
