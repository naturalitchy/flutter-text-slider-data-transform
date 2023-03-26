
import 'package:flutter/material.dart';
import 'package:text_transform/const/colors.dart';

class SliderInputScreen extends StatelessWidget {
  const SliderInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
          child: Text(' A B C D E F G '),
        ),
      ),
    );

  }
}