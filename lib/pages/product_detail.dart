import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:pphelper/components/product/product_detail_expain.dart';
import 'package:pphelper/controller/constant_controller.dart';
import 'package:pphelper/controller/product_controller.dart';
import 'package:pphelper/model/product.dart';

import '../components/product/product_detail_bottombar.dart';
import '../components/product/product_detail_tabbar.dart';
/**
 * 商品详情页
 */

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);

  late double _screenWidth  = 0.0;
  late double _screenHeight  = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;

    return Container(
      child: GetBuilder<ProductController>(
        id: ConstantController.REFRESH_PRODUCT,
        builder: (controller) {
          ProductModel productItem = ProductController.to.getCurrentProductModel;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_sharp),
                onPressed: () {
                  //返回
                  Navigator.pop(context);
                },
              ),
              title: Text(productItem.productName,),
              centerTitle: true,
            ),
            body: Container(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      _productImageView(productItem),
                      _productBasicView(productItem),
                      ProductDetailExpain(),
                      ProductDetailTabber(),
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      //底部购物车栏目
                      child: ProductDetailBottomBar()
                  )
                ],
              )
            )
          );
        },
      )
    );
  }

  //商品图片
  Widget _productImageView(item) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: _screenWidth,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              item.imageUrl[index],
              fit: BoxFit.fitWidth,
            ),
          );
        },
        itemCount: item.imageUrl.length,
        scale: 0.7,
        pagination: new SwiperPagination(),
        autoplay: true,
        controller: new SwiperController(),
      ),
    );
  }

  //商品基本信息
  Widget _productBasicView(item) {
    return Container(
      height: ScreenUtil().setHeight(227),
      width: _screenWidth,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //商品名称
          Container(
            child: Text(
              item.productName,
              maxLines: 1,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
              ),
            ),
          ),
          //商品编号
          Container(
            margin: EdgeInsets.only(top:8.0),
            child: Text(
              '编号:${item.id}',
              style: TextStyle(
                  color: Colors.black26
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "￥${item.productPrice}",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.w300,
                      color: Colors.red
                  ),
                ),
              ),
              Container(
                child: Text(
                  "数量:${item.productCount}",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(18),
                      color: Colors.grey
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              item.productDesc,
              textAlign: TextAlign.left,
            ),
          )
        ],
      )
    );
  }
}
