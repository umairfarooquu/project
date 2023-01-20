import 'package:exd_flutter_project/auth_screen/authentication_services.dart';
import 'package:exd_flutter_project/consts/consts.dart';
import 'package:exd_flutter_project/widgets_common/applogo_widget.dart';
import 'package:exd_flutter_project/widgets_common/bg_widget.dart';
import 'package:exd_flutter_project/widgets_common/buttons.dart';
import 'package:exd_flutter_project/widgets_common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
              "Join the $appname".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Column(
                children: [
                  customtextfield(
                      controller: nameController, hint: nameHint, title: name),
                  customtextfield(
                      controller: emailController,
                      hint: emailHint,
                      title: email),
                  customtextfield(
                      controller: passwordController,
                      hint: passwordHint,
                      title: password),
                  customtextfield(
                      controller: phoneController, hint: phone, title: phone),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                          value: false,
                          checkColor: redColor,
                          onChanged: (newValue) {}),
                      5.widthBox,
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                      fontFamily: bold, color: fontGrey)),
                              TextSpan(
                                  text: termsAndCond,
                                  style: TextStyle(
                                      fontFamily: bold, color: redColor)),
                              TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                      fontFamily: bold, color: fontGrey)),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                      fontFamily: bold, color: redColor))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  ourButton(
                      color: redColor,
                      title: signup,
                      textColor: whiteColor,
                      onPress: () {
                        AuthenticationServices.signUp(
                            context: context,
                            email: emailController.text.toString(),
                            password: passwordController.text.toString(),
                            name: nameController.text.toString(),
                            phone: phoneController.text.toString());
                      }).box.width(context.screenWidth).make(),
                  5.heightBox,
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "$alreadyAccount ",
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: login,
                            style:
                                TextStyle(fontFamily: bold, color: redColor)),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  })
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
