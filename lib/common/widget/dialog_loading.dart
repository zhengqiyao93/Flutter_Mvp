import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/utils/util_ui.dart';

/// 加载dialog
class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new Material( //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center( //保证控件居中效果
          child:SingleChildScrollView(
            child: new SizedBox(
              width: UIUtil.getWidth(120),
              height: UIUtil.getWidth(120),
              child: new Container(
                decoration: ShapeDecoration(
                  color: Color(0xff262626),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CupertinoActivityIndicator(),
                    new Padding(
                      padding: EdgeInsets.only(
                        top:UIUtil.getHeight(10)
                      ),
                      child: new Text(
                        text,
                        style: new TextStyle(fontSize: 12.0,color: Color(0xffffffff)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}