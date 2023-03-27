
import 'package:flutter/material.dart';
import 'package:text_transform/screen/root_screen.dart';

class TextResultScreen extends StatefulWidget {

  TextResultScreen({Key? key}) : super(key: key);

  @override
  State<TextResultScreen> createState() => _TextResultScreenState();
}

class _TextResultScreenState extends State<TextResultScreen> {


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, top: 100, bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text(' H H H H HH H H '),
              )
            ),
          ),
          // Container(
          //
          //   height: 11.0,
          //   width: 100,
          //   color: Colors.grey,
          //   child: Text(' Hello !!!'),
          // ),

          // Text('Bottom text is  '),
          // SizedBox(height: 50.0,),
          // Text(' => ${RootScreen.staticStr}'),
        ],
      ),
    );
  }
}