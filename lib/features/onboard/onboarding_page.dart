// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/features/auth/login.dart';

import '../../core/const/const_barrel.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Text(
                'SKIP',
                style: AppTextStyles.regular16
                    .copyWith(color: Colors.black, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 52,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    height: 92,
                    width: 172,
                    ImageAssets.logo,
                  ),
                ],
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const [
              OnboardingPage(
                details: 'Schedule your classes \neasily and efficiently. ',
              ),
              OnboardingPage(
                details:
                    'Download your course \nmaterials and \neducative content.',
              ),
              OnboardingPage(
                details: 'Set reminder & \nnotification for \ninstructors',
              ),
            ],
          ),
          Positioned(
            top: 506,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(
                      height: 10.0,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                width: _currentPage == index ? 32 : 32,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? ColorStyles.primaryBlue
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          if (_currentPage < 2) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          } else if (_currentPage == 2) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          }
                        },
                        // _currentPage == 2 ? _goToNextPage : _goToAccount,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFCDDFF9),
                            shape: OvalBorder(),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: ColorStyles.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String details;

  const OnboardingPage({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(253),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Learn with Ease',
                style: AppTextStyles.regular16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF8D8D8D),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                details,
                maxLines: 3,
                style: AppTextStyles.regular36.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
