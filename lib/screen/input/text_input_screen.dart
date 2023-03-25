

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    print('firstTextField = ${firstTextField}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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