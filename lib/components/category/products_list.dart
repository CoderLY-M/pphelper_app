import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pphelper/pages/product_detail.dart';
import 'package:pphelper/router/app_pages.dart';
import 'package:pphelper/router/app_routes.dart';


/**
 * 商品列表展示
 */
class ProductsList extends StatelessWidget {
  final List productLists;

  const ProductsList({Key? key, required this.productLists}) : super(key: key);

  //商品列表的标题
  Widget _productListTitleWidget() {
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
            '在售商品',
            style:TextStyle(color:Colors.blue)
        )
    );
  }

  //商品纵向组件
  Widget _verticalProductWidget() {
    if(productLists.length != 0) {
      productLists.map((item){
        return _productItem(item);
      }).toList();
      return MasonryGridView.count(
        // 展示几列
        crossAxisCount: 2,
        // 元素总个数
        itemCount: productLists.length,
        // 单个子元素
        itemBuilder: (BuildContext context, int index) => _productItem(productLists[index]),
        // 纵向元素间距
        mainAxisSpacing: 10,
        // 横向元素间距
        crossAxisSpacing: 10,
        //本身不滚动，让外面的singlescrollview来滚动
        physics:const NeverScrollableScrollPhysics(),
        shrinkWrap: true, //收缩，让元素宽度自适应
      );
    }else{
      return Text("");
    }
  }

  //商品项
  Widget _productItem(item){
    return InkWell(
      onTap:() {
        Get.toNamed(Routes.PRODUCT_DETAIL,arguments: {"productId": item["id"]});
      },
      child: Container(
        width: ScreenUtil().setWidth(350),
        padding: EdgeInsets.all(10.0),
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
                item["imageUrl"],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: Text(
                "${item["productName"]}",
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
                  "￥${item["productPrice"]}",
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
                  child: Text("浏览量:${item["viewCount"]}",style: TextStyle(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _productListTitleWidget(),
          _verticalProductWidget()
        ],
      ),
    );
  }
}



