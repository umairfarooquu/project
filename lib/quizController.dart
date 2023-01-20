import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizController extends GetxController {
  RxInt count = 0.obs;
  RxString name = "".obs;
  RxBool color = false.obs;
  RxBool theme = false.obs;

  updateValues() {
    count.value = 500;
    name.value = "Pakistan 55555555555";
    update();
  }

  incrementValue() {
    count.value = count.value + 1;
    update();
  }

  changeColor() {
    if (color == false) {
      color.value = true;
    } else if (color == true) {
      color.value = false;
    }
  }

  changeTheme() {
    if (theme == false) {
      theme.value = true;
    } else {
      theme.value = false;
    }
  }

  ThemeChange() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("themeColor")) {
      prefs.setBool('themeColor', false);
    } else {
      prefs.setBool('themeColor', false);
    }
  }
}
