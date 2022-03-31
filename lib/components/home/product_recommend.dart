import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/service_api.dart';

/**
 * 商品推荐组件
 */

class ProductRecommend extends StatefulWidget {
  const ProductRecommend({Key? key}) : super(key: key);

  @override
  _ProductRecommendState createState() => _ProductRecommendState();
}

class _ProductRecommendState extends State<ProductRecommend> {
  late List recommendProductList = [];

  @override
  Widget build(BuildContext context) {
    if(recommendProductList != null && recommendProductList.length != 0){
      return Container(
        height: ScreenUtil().setHeight(380),
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            _recommendTitleWidget(),
            _lineProductWidget()
          ],
        ),
      );
    }else{
      return Text("");
    }
  }

  @override
  void initState() {
    super.initState();
    loadHomeSwiperImage();
  }

  //获取推荐商品数据
  loadHomeSwiperImage() async {
    await requestRecommendProducts().then((value){
      setState(() {
        recommendProductList = value["data"]["lists"];
      });
    });
  }

  //推荐商品的标题
  Widget _recommendTitleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
        decoration: BoxDecoration(
            color:Colors.white,
            border: Border(
                bottom: BorderSide(width:0.5,color:Colors.black12)
            )
        ),
        child:Text(
            '商品推荐',
            style:TextStyle(color:Colors.blue)
        )
    );
  }

  //推荐商品项
  Widget _productItem(index){
    return InkWell(
      onTap:() {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width:0.5,color:Colors.black12),
              left: BorderSide(width:0.5,color:Colors.black12),
              right: BorderSide(width:0.5,color:Colors.black12),
              bottom: BorderSide(width:0.5,color:Colors.black12),
            ),
            borderRadius: new BorderRadius.circular((10.0))
        ),
        child: Column(
          children: [
            Container(
              child: Image.network(
                recommendProductList[index]["imageUrl"],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: Text(
                "${recommendProductList[index]["productName"]}",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(25),
                    height: ScreenUtil().setHeight(2)
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "￥${recommendProductList[index]["productPrice"]}",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenUtil().setSp(25),
                      height: ScreenUtil().setHeight(1.5)
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text("浏览量:${recommendProductList[index]["viewCount"]}",style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    height: ScreenUtil().setHeight(3),
                  ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //推荐商品横向组件
  Widget _lineProductWidget() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        itemBuilder: (BuildContext context,index) {
          return _productItem(index);
        },
        scrollDirection: Axis.horizontal,
        itemCount: recommendProductList.length,
      ),
    );
  }
}

