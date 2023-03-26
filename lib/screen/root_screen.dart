
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_transform/const/colors.dart';
import 'package:text_transform/screen/home_screen.dart';
import 'package:text_transform/screen/input/text_input_screen.dart';
import 'package:text_transform/screen/input/slider_input_screen.dart';
import 'package:text_transform/screen/output/slider_result_screen.dart';
import 'package:text_transform/screen/output/text_result_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  int _tabNumber = 0;
  List<Widget> _pages = <Widget> [
    HomeScreen(),
    TextInputScreen(),
    SliderInputScreen(),
  ];

  // Setting the PageController.
  final PageController _pageController = PageController();
  // Setting the TabController.
  TabController? _tabController;

  // Initialize the PageController.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Must be add with TickerProviderStateMixin class.
    _tabController = TabController(length: 4, vsync: this);

    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        int? currentPage = _pageController.page?.toInt();
        // 현재 페이지가 없으면 종료.
        if(currentPage == null) {
          return;
        }
        // 5개 이미지를 모두 돌렸다면 다시 처음부터.
        if(currentPage == 4) {
          currentPage = 0;
        } else {
          currentPage++;
        }

        _pageController.animateToPage(
          currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );

      }
    );
  }

  void nothing() {

  }

  void tabClicked(int num) {
    setState(() {
      _tabNumber = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 상태바 색상 변경. 상태바가 어디를 말하는거임... 색상도 안변함. 맨 위의 그 와이파이 있고 그 부분이네.
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      appBar: appBarSetting(),

      body: bodySetting(),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabController!.index,
        onTap: (int index) {
          setState(() {
            _tabController!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'TextResult',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow),
            label: 'SliderResult',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'TextResult',
          ),
        ],
      ),
    );
  }

  // Setting the AppBar in Scaffold.
  AppBar appBarSetting() {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      leading: IconButton(
        color: firstColor,
        focusColor: firstColor,
        iconSize: 30,
        icon: Icon(
          Icons.home,
        ),
        onPressed: () {

          tabClicked(0);
        },
      ),
      title: Text('I think...'),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TextInputScreen(),
                  ),
                );
                tabClicked(1);
              },
              child: Text('Text'),
            ),
            SizedBox(width: 10.0,),
            ElevatedButton(
              onPressed: () {
                tabClicked(2);
              },
              child: Text('Slider'),
            ),
            SizedBox(width: 10.0,),
          ],
        ),
      ],
    );
  }

  // Setting the body in Scaffold.
  Widget bodySetting() {

    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(30),
            color: Colors.yellow,
            child: PageView(
              controller: _pageController,
              children: [1,2,3,4,5].map(
                    (number) => Image.asset('asset/img/image_${number}.jpeg', fit: BoxFit.cover,),
              ).toList(),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Container(
            color: secondColor,
            child: Center(
              child: Text(' Im Root Screen. Column 2st.'),
            ),
          ),
          /*
          child: Container(
            padding: EdgeInsets.all(30),
            color: secondColor,
            child: _pages[_tabNumber],
          ),
          */
        ),
      ],
    );

    return Column(
      children: [
        // =============== Column 1 ===============
        Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.yellow,
                child: PageView(
                  controller: _pageController,
                  children: [1,2,3,4,5].map(
                        (number) => Image.asset('asset/img/image_${number}.jpeg', fit: BoxFit.cover,),
                  ).toList(),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(30),
                color: secondColor,
                child: _pages[_tabNumber],
              ),
            ),
          ],
        ),
        // =============== Column 2 ===============
        TabBarView(
          controller: _tabController,
          children: [
            TextResultScreen(),
            SliderResultScreen(),
            TextResultScreen(),
            SliderResultScreen(),
          ],
        ),
      ],
    );


  }

}