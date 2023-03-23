import 'package:flutter/material.dart';
import 'package:text_transform/const/colors.dart';
import 'package:text_transform/const/fonts.dart';
import 'package:text_transform/screen/root_screen.dart';

/**
 * 본 프로젝트는 하나의 스크린에서 다른 스크린에 데이터를 보내는것을 목적으로 한다.
 * 또한, initState, controller, slider, textInput의 사용을 목적으로 한다.
 *
 */

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: mainColor,
        appBarTheme: AppBarTheme(
          color: thirdColor,
          titleTextStyle: TextStyle(
            color: secondColor,
            fontWeight: fontWeight700,
            fontSize: 20.0,
          ),
          toolbarTextStyle: TextStyle(
            fontWeight: fontWeight900,
            fontSize: 16.0,
          )
        ),
      ),
      home: RootScreen(),
    ),
  );
}
