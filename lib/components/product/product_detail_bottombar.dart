import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 商品详细信息栏底部bar
 */

class ProductDetailBottomBar extends StatelessWidget {
  const ProductDetailBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.black45
        )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(110) ,
              // alignment: Alignment.bottomCenter,
              child:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 35,
                      color: Colors.blue,
                    ),
                    Text(
                      "购物车",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil().setSp(15)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: MaterialButton(
                    onPressed: () {  },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.blue,
                    child: Text(
                      "加入购物车",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: MaterialButton(
                    onPressed: () {  },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.red,
                    child: Text(
                      "立即购买",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
