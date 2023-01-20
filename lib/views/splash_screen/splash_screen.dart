import 'package:exd_flutter_project/auth_screen/login_screen.dart';
import 'package:exd_flutter_project/consts/consts.dart';
import 'package:exd_flutter_project/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //method to change to screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 5), (() {
      Get.to(() => LoginScreen());
    }));
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              icSplashBg,
              width: 300,
            ),
            20.heightBox,
            applogowidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.fontFamily(regular).white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox
          ],
        ),
      ),
    );
  }
}
