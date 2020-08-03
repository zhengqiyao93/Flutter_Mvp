import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page_home.dart';
import 'package:flutter_app/view/page_car_list.dart';

/// 首页导航布局，4个tab页
class TabNavigator extends StatefulWidget {
  @override
  TabNavigatorState createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController(initialPage: 0);
  final _defaultColor = Color(0xFFA4AAB3);
  final _activeColor = Color(0xFFFFD500);
  int _currentIndex = 0;

  HomePage _tabPage1 = HomePage();
  CarListPage _tabPage2 = CarListPage();
  HomePage _tabPage3 = HomePage();
  HomePage _tabPage4 = HomePage();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          _tabPage1,
          _tabPage2,
          _tabPage3,
          _tabPage4,
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          items: [
            getItem(0, "页面1", "images/home_selected.png", "images/home_default.png", 24, 24),
            getItem(1, "列表2", "images/xsjp_selected.png", "images/xsjp_default.png", 20, 25),
            getItem(2, "页面3", "images/xcjp_selected.png", "images/xcjp_default.png", 23, 23),
            getItem(3, "页面4", "images/my_selected.png", "images/my_default.png", 22, 22),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem getItem(int index, String title, String selectedImage, String defaultImage, double width, double height) {
    return BottomNavigationBarItem(
      icon: Image.asset(_currentIndex != index ? defaultImage : selectedImage,
        width: width,
        height: height,),
      title: Padding(padding: EdgeInsets.only(top: 2.5),
        child: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor, fontSize: 20
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
