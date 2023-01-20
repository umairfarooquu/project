import 'package:exd_flutter_project/quizController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exd_flutter_project/consts/consts.dart';

class ClassQuiz extends StatelessWidget {
  const ClassQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.put(QuizController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () {
                return Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        color: quizController.color == true
                            ? Colors.red
                            : Colors.green));
              },
            ),
            20.heightBox,
            ElevatedButton(
                onPressed: () {
                  quizController.changeColor();
                  // controller.updateValues();
                  // quizController.name.value = "exd LAhore";
                  // if (quizController.color.value == false) {
                  //   quizController.color.value = true;
                  // } else {
                  //   quizController.color.value = false;
                  // }
                },
                child: const Text("Builder Update")),
            ElevatedButton(
                onPressed: () {
                  quizController.theme == true
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());

                  quizController.changeTheme();
                },
                child: const Text("change theme")),
          ]),
    );
  }
}
