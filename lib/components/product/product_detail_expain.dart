import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * 商品详情页说明
 */

class ProductDetailExpain extends StatelessWidget {
  ProductDetailExpain({Key? key}) : super(key: key);
  late double _screenWidth  = 0.0;
  late double _screenHeight  = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;

    return Container(
      width: _screenWidth,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.add_location_outlined, color: Colors.red,),
          Text(
            "发货地址:",
            style: TextStyle(
                color:Colors.red,
                fontSize:ScreenUtil().setSp(20)
            ),
          ),
          Text(
            "湖北省",
            style: TextStyle(
              color:Colors.red,
              fontSize:ScreenUtil().setSp(20)
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.red,size: ScreenUtil().setSp(20),),
          Text(
            "武昌区",
            style: TextStyle(
                color:Colors.red,
                fontSize:ScreenUtil().setSp(20)
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.red,size: ScreenUtil().setSp(20),),
          Text(
            "武汉市",
            style: TextStyle(
                color:Colors.red,
                fontSize:ScreenUtil().setSp(20)
            ),
          ),
        ],
      ),
    );
  }
}
