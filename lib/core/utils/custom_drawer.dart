import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/Features/home/presentation/views/edit_profile.dart';
import 'package:medical_app/Features/splash/presentation/views/splash_view.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/core/utils/styles.dart';
import 'package:medical_app/helper.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 187.5,
      child: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.green,
                child: SvgPicture.asset(AssetData.sign),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ghalia AJ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 75,
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Setting',
                        style: Styles.text16.copyWith(fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileView()));
                      },
                    ),
                    const SizedBox(height: 21),
                    Text('Dark Mode', style: Styles.text16.copyWith(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 21),
                    Text('About Us', style: Styles.text16.copyWith(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.navigateOffTo(
                        const SplashView(),
                      );
                    },
                    child: SvgPicture.asset(
                      AssetData.icon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Log out',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
