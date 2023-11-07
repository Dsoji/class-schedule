// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';

class CourseTile extends StatelessWidget {
  final String title;
  final String subTitle;

  const CourseTile({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        width: 24,
        height: 24,
        ImageAssets.pdf,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.regular12.copyWith(
          color: Colors.black.withOpacity(0.75),
        ),
      ),
      subtitle: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: AppTextStyles.regular12.copyWith(
          color: Colors.black.withOpacity(0.75),
        ),
      ),
      trailing: InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          SvgAssets.dwnld,
          width: 16,
          height: 16,
          color: ColorStyles.primaryBlue,
        ),
      ),
    );
  }
}

class ContTile extends StatelessWidget {
  final String title;
  final String subTitle;

  const ContTile({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            width: 24,
            height: 24,
            ImageAssets.pdf,
          ),
          const Gap(8),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title.pdf',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontSize: 12,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontSize: 12,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              SvgAssets.dwnld,
              width: 16,
              height: 16,
              color: ColorStyles.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
