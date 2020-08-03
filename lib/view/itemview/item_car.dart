


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/utils/util.dart';
import 'package:flutter_app/common/utils/util_ui.dart';
import 'package:flutter_app/models/bean/car_entity.dart';

typedef void CollectionClickListener(CarEntity carEntity);

class OnlineCarItem extends StatefulWidget {

  final CarEntity carEntity;

  final CollectionClickListener listener;

  OnlineCarItem(this.carEntity, this.listener);

  @override
  _OnlineCarItemState createState() => _OnlineCarItemState();
}

class _OnlineCarItemState extends State<OnlineCarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 18, right: 18),
      decoration: UIUtil.getRadiusBackground(15.0, Colors.white),
      height: UIUtil.getHeight(395.0),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
//              child: Image.network(
//                widget.carEntity.mainPhoto,
//                height: UIUtil.getHeight(190),
//                width: double.infinity,
//                fit: BoxFit.fitWidth,
//              )
                child: CachedNetworkImage(
                  imageUrl: widget.carEntity.mainPhoto,
                  height: UIUtil.getHeight(190),
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
//                placeholder: (context, url) => CircularProgressIndicator(),
//                errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),

              Container(
                height: UIUtil.getHeight(30),
                margin: EdgeInsets.only(top: 20, left: 17),
                padding: EdgeInsets.only(left: 5, right: 10),
                decoration: UIUtil.getRadiusBackground(5, Color(0x778E98A3)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      "images/xsjp_icon.png",
                      width: UIUtil.getWidth(19),
                      height: UIUtil.getHeight(19),
                    ),
                    UIUtil.createText("00时21分28秒", 14, Colors.white),
                  ],
                ),
              ),

              UIUtil.createText(widget.carEntity.autoInfoName, 16, Color(0xFF444444), isBold: true, margin: EdgeInsets.only(top: 15, left: 17)),

              UIUtil.createText("5万起拍", 16, Color(0xFFFFD500), isBold: true, margin: EdgeInsets.only(top: 8, left: 17)),

              Row(
                children: <Widget>[
                  UIUtil.createText(widget.carEntity.vehicleAttributionCity, 16, Color(0xFFA6ACB5), margin: EdgeInsets.only(top: 8, left: 17)),
                  UIUtil.createText("2万公里", 16, Color(0xFFA6ACB5), margin: EdgeInsets.only(top: 8, left: 5)),
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 5),
                    alignment: Alignment.center,
                    width: UIUtil.getWidth(21),
                    height: UIUtil.getHeight(14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFA4AAB3), width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(3)
                    ),
                    child: UIUtil.createText("B", 10, Color(0xFFA4AAB3)),
                  )
                ],
              ),

              UIUtil.createText("开拍时间：2020-04-28 15:00", 16, Color(0xFFA6ACB5), margin: EdgeInsets.only(top: 8, left: 17)),

            ],
          ),

          //收藏按钮
          Positioned(
            child: InkWell(
              child: Image.asset(
                Util.equals(widget.carEntity.isFollow, "1") ? "images/follow_selected.png" : "images/follow_default.png",
                width: 60, height: 60,
              ),
              onTap: (){
                widget.listener(widget.carEntity);
              },
            ),
            right: UIUtil.getWidth(20),
            bottom: UIUtil.getHeight(30),
          )
        ],
      ),
    );
  }
}
