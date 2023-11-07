// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';

class UploadMaterial extends StatelessWidget {
  const UploadMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Upload Materials',
          style: AppTextStyles.regular24.copyWith(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: SvgPicture.asset(
                SvgAssets.x,
                width: 25.17,
                height: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(36),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name of materials',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(6),
              FormBuilderTextField(
                name: 'Materials',
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Name of materials',
                  hintStyle: TextStyle(
                    color: Color(0xBF212121),
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(24),
              Container(
                width: double.infinity,
                height: 120,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: Colors.black.withOpacity(0.75),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF055FE0),
                        shape: OvalBorder(),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      'Tap here and browse your file ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7A7A7A),
                        fontSize: 12,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name of materials',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(6),
              FormBuilderTextField(
                name: 'Materials',
                maxLines: 5,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Name of materials',
                  hintStyle: TextStyle(
                    color: Color(0xBF212121),
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(24),
              Center(
                child: FullButton(
                  color: ColorStyles.primaryBlue,
                  height: 48,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const BottomNavBar(),
                    //   ),
                    // );
                  },
                  text: 'Upload Materials',
                  width: 343,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
