import 'package:exd_flutter_project/auth_screen/Signup_screen.dart';
import 'package:exd_flutter_project/auth_screen/authentication_services.dart';
import 'package:exd_flutter_project/consts/consts.dart';
import 'package:exd_flutter_project/widgets_common/applogo_widget.dart';
import 'package:exd_flutter_project/widgets_common/bg_widget.dart';
import 'package:exd_flutter_project/widgets_common/buttons.dart';
import 'package:exd_flutter_project/widgets_common/custom_textfield.dart';
import 'package:exd_flutter_project/widgets_common/socialicon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogowidget(),
              10.heightBox,
              "Login in to $appname"
                  .text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(),
              10.heightBox,
              Column(
                children: [
                  customtextfield(
                      controller: emailController,
                      hint: emailHint,
                      title: email),
                  customtextfield(
                      controller: passwordController,
                      hint: passwordHint,
                      title: password),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: (() {}), child: forgetPass.text.make())),
                  5.heightBox,
                  ourButton(
                      color: redColor,
                      title: login,
                      textColor: whiteColor,
                      onPress: () {
                        AuthenticationServices.login(
                            context: context,
                            email: emailController.text.toString(),
                            password: passwordController.text.toString());
                        // AuthenticationServices.signUp(
                        //   context: context,
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // );
                      }).box.width(context.screenWidth).make(),
                  5.heightBox,
                  createNewAccout.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                      color: lightgolden,
                      title: signup,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => SignUpScreen());
                      }).box.width(context.screenWidth).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialIcon(0)
                          .box
                          .padding(const EdgeInsets.all(10))
                          .make(),
                      socialIcon(1)
                          .box
                          .padding(const EdgeInsets.all(10))
                          .make(),
                      socialIcon(2)
                          .box
                          .padding(const EdgeInsets.all(10))
                          .make(),
                    ],
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .shadowSm
                  .padding(const EdgeInsets.all(18))
                  .width(context.screenWidth - 70)
                  .make()
            ],
          ),
        ),
      ),
    ));
  }
}
