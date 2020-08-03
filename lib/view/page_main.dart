import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/tab_navigator.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {

    return TabNavigator();
  }
}