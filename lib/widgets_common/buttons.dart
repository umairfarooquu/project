import 'package:exd_flutter_project/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({color, String? title, textColor, onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: color, padding: const EdgeInsets.all(12)),
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
