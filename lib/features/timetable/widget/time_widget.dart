import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/const/const_barrel.dart';

class TimeWidget extends StatelessWidget {
  final String date;
  final String time;
  final String course;
  final String location;

  const TimeWidget(
      {super.key,
      required this.date,
      required this.time,
      required this.course,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 87,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: AppTextStyles.regular12.copyWith(
              color: Colors.black.withOpacity(0.75),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(12),
          Container(
            width: double.infinity,
            height: 57,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      time,
                      style: AppTextStyles.regular16.copyWith(
                        color: const Color(0xFF212121),
                      ),
                    ),
                    const Gap(2),
                    Text(
                      time,
                      style: AppTextStyles.regular12.copyWith(
                        color: const Color(0xFF212121),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Gap(9),
                Container(
                  width: 4,
                  height: 57,
                  decoration: const BoxDecoration(color: Color(0xFF055FE0)),
                ),
                Container(
                  height: 57,
                  width: 269,
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  decoration: const BoxDecoration(
                    color: Color(0x33CDDFF9),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course,
                        style: AppTextStyles.regular16.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const Gap(2),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 12, height: 12, color: Colors.blue),
                          const Gap(8),
                          Text(
                            location,
                            style: AppTextStyles.regular12.copyWith(
                              color: const Color(0xFF8D8D8D),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
