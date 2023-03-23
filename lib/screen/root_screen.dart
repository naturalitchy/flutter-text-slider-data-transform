
import 'package:flutter/material.dart';
import 'package:text_transform/const/colors.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        // leading: IconButton(
        //   color: mainColor,
        //   focusColor: firstColor,
        //   icon: Icon(
        //     Icons.arrow_back,
        //   ),
        //   onPressed: () {
        //
        //   },
        // ),
        title: Text('I think...'),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Text'),
              ),
              SizedBox(width: 10.0,),
              ElevatedButton(
                onPressed: () {},
                child: Text('Slider'),
              ),
              SizedBox(width: 10.0,),
            ],
          ),


        ],
      ),

    );
  }
}