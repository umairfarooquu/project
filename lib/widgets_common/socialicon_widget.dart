import 'package:exd_flutter_project/consts/consts.dart';
import 'package:flutter/material.dart';

Widget socialIcon(
  imageindex,
) {
  return CircleAvatar(
    radius: 25,
    backgroundColor: lightGrey,
    child: Image.asset(
      socialIconList[imageindex],
      width: 30,
    ),
  );
}
