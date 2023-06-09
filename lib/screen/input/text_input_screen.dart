

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_transform/const/colors.dart';
import 'package:text_transform/screen/root_screen.dart';
import 'package:text_transform/static/static_variable.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({Key? key}) : super(key: key);


  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {

  final TextEditingController textEditingController = TextEditingController();
  String firstTextField = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.addListener(() {
      initFirstTextFieldVar(textEditingController.text);
    });

  }
  void initFirstTextFieldVar(String str) {
    firstTextField = str;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StaticVariable.staticStr = textEditingController.text;
    print('staticStr = ${RootScreen.staticStr}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input page.'),
        centerTitle: true,
        backgroundColor: firstColor,
      ),
      body: Container(
        color: secondColor,
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Welcome..',
                  label: Text('Please input the text'),
                  contentPadding: EdgeInsets.only(left: 20.0),
                ),
              ),
              SizedBox(height: 50.0,),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'I dont know',
                  label: Text('I didnt know that'),
                ),
              )
            ],
          ),
        ),
      ),
    );

    return Container(
      // color: Colors.white,
      child: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Welcome..',
                label: Text('Please input the text'),
                contentPadding: EdgeInsets.only(left: 20.0),
              ),
            ),
            SizedBox(height: 50.0,),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'I dont know',
                label: Text('I didnt know that'),
              ),
            )
          ],
        ),
      ),
    );

  }
}