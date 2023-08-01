import 'package:flutter/material.dart';
import 'package:hangman/util/colors.dart';

Widget hiddenletter(String char, bool visible) {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), color: Colors.white),
    child: Visibility(
        visible: !visible,
        child: Text(
          char,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.bgcolor),
        )),
  );
}
