// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/features/auth/login.dart';
import 'package:scheduler/features/bottomNavigation/bottom_pages_brrel.dart';
import 'package:scheduler/features/home/view/pages/assignment.dart';
import 'package:scheduler/features/profile/view/pages/edit_profile.dart';
import 'package:scheduler/features/profile/view/pages/my_courses.dart';
import 'package:scheduler/features/profile/view/pages/notification_page.dart';
import 'package:scheduler/features/profile/view/pages/reset_password.dart';
import 'package:scheduler/features/teacher/class/view_class.dart';
import 'package:scheduler/features/teacher/material/upload_assignmen.dart';
import 'package:scheduler/features/teacher/material/upload_material.dart';
import 'package:scheduler/features/teacher/send_message.dart';

import '../../../core/const/const_barrel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String userRole = Provider.of<UserRoleProvider>(context).userRole;
    String userName = Provider.of<UserRoleProvider>(context).userName;
    String userEmail = Provider.of<UserRoleProvider>(context).userEmail;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfile()),
                );
              },
              child: Text(
                'EDIT',
                style: AppTextStyles.regular16
                    .copyWith(color: const Color.fromRGBO(5, 95, 224, 1)),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(22),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                  ),
                  const Gap(10),
                  SizedBox(
                    height: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.regular24.copyWith(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          userEmail,
                          style: AppTextStyles.regular16.copyWith(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(25),

            Visibility(
              visible: userRole == 'Student',
              child: ProfileTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyCourse()),
                  );
                },
                title: 'My courses',
                svg: SvgAssets.book,
                color: const Color.fromRGBO(198, 72, 242, 1),
              ),
            ),
            const Gap(16),

            Visibility(
              visible: userRole == 'Teacher',
              child: ProfileTile2(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewClass()),
                  );
                },
                title: 'View Class',
                svg: ImageAssets.view,
              ),
            ),
            const Gap(16),

            Visibility(
              visible: userRole == 'Student',
              child: ProfileTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TimetablePage()),
                    );
                  },
                  title: 'Class schedule',
                  svg: SvgAssets.cal,
                  color: const Color.fromRGBO(5, 95, 224, 1)),
            ),
            const Gap(16),

            Visibility(
              visible: userRole == 'Teacher',
              child: ProfileTile2(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadMaterial()),
                  );
                },
                title: 'Upload Material',
                svg: ImageAssets.upldM,
              ),
            ),
            const Gap(16),

            Visibility(
              visible: userRole == 'Student',
              child: ProfileTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()),
                  );
                },
                title: 'Notifications',
                svg: SvgAssets.bell,
                color: Colors.black,
              ),
            ),
            const Gap(16),

            Visibility(
              visible: userRole == 'Teacher',
              child: ProfileTile2(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadAssignment()),
                  );
                },
                title: 'Upload Assignment',
                svg: ImageAssets.upldA,
              ),
            ),
            const Gap(16),
            // if (userRole == 'Student')
            Visibility(
              visible: userRole == 'Student',
              child: ProfileTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AssignmentsPage()),
                  );
                },
                title: 'Assignment',
                svg: SvgAssets.ass,
                color: const Color.fromRGBO(5, 224, 145, 1),
              ),
            ),

            const Gap(16),

            Visibility(
              visible: userRole == 'Teacher',
              child: ProfileTile2(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SendMessage()),
                  );
                },
                title: 'Send Message',
                svg: ImageAssets.send,
              ),
            ),
            const Gap(16),
            ProfileTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassword()),
                );
              },
              title: 'Change Password',
              svg: SvgAssets.pswrd,
              color: const Color.fromRGBO(255, 0, 92, 1),
            ),
            const Gap(16),

            const Gap(48.86),
            //logout button
            GestureDetector(
              onTap: () {
                logout(context);
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //to logout
  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    // Clear the user details using the UserRoleProvider's clearUserDetails method.
    Provider.of<UserRoleProvider>(context, listen: false).clearUserDetails();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
