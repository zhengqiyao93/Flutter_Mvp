import 'package:flutter/material.dart';

class UIUtil {

  //设置宽度，如果需要适配，用ScreenUtil().setWidth(width)即可
  static double getWidth(double width) {
    return width;
//    return ScreenUtil().setWidth(width);
  }

  //设置高度，如果需要适配，用ScreenUtil().setHeight(height)即可
  static double getHeight(double height) {
    return height;
//    return ScreenUtil().setHeight(height);
  }

  //设置高度，如果需要适配，用ScreenUtil().setSp(fontSize)即可
  static double getSp(double fontSize) {
    return fontSize;
//    return ScreenUtil().setSp(fontSize);
  }

  //设置topMargin
  static EdgeInsets setMarginTop(double margin) {
    return EdgeInsets.only(top: margin);
  }

  //设置圆角背景
  static Decoration getRadiusBackground(double radius, Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [ //阴影
          BoxShadow(
              color:Color(0x113B3B3B),
              offset: Offset(0.0,1.0),
              blurRadius: radius
          )
        ]
    );
  }

  //设置渐变背景
  static Decoration getGradientBackground(List<Color> colors, double radius) {
    return BoxDecoration(
        gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
        borderRadius: BorderRadius.circular(3.0), //3像素圆角
        boxShadow: [ //阴影
          BoxShadow(
              color:Colors.black54,
              offset: Offset(2.0,2.0),
              blurRadius: 4.0
          )
        ]
    );
  }


  ///创建常用视图
  //创建文字
  static Widget createText(String text, double fontSize, Color color, {bool isBold = false, double letterSpacing, TextAlign textAlign, EdgeInsets margin}) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: getSp(fontSize),
          color: color,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          letterSpacing: letterSpacing,
        ),
        textAlign: textAlign,
      ),
      margin: margin,
//      decoration: BoxDecoration(
//        color: Colors.blueAccent,
//        borderRadius: BorderRadius.circular(5),
//      ),
    );
  }

  //创建圆形头像
  static Widget createClipOval(String avatar, double width, double height) {
    return ClipOval(
      child: Image.network(
        avatar,
        width: UIUtil.getWidth(width),
        height: UIUtil.getHeight(height),
      ),
    );
  }



  ///创建dialog
  static void createDialog(BuildContext context, String title, String content, Function _confirm) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: UIUtil.createText(title, 16, Colors.black),
          content: UIUtil.createText(content, 14, Colors.black),
          actions: <Widget>[
            FlatButton(
                child: UIUtil.createText("取消", 16, Colors.black),
                onPressed: (){
                  Navigator.of(context).pop();
                }
            ),
            FlatButton(
              child: UIUtil.createText("确认", 16, Colors.black),
              onPressed: (){
                Navigator.of(context).pop();
                _confirm();
              },
            )
          ],
        );
      }
    );

  }

}