import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/components/product/product_detail_web.dart';
import 'package:pphelper/controller/constant_controller.dart';
import 'package:pphelper/controller/product_detail_controller.dart';

/**
 * 商品详情页的评论与详情切换的tabber
 */

class ProductDetailTabber extends StatelessWidget {
  const ProductDetailTabber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        init: ProductDetailController(),
        builder: (controller) {
          return Container(
            width: MediaQuery.of(context).size.width,
            constraints: const BoxConstraints(
              minHeight: 300
            ),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    TabberLeft(),
                    TabberRight(),
                  ],
                ),
                ProductDetailWeb()
              ],
            )
          );
        }
    );
  }
}

/**
 * 左边的tabber
 */
class TabberLeft extends StatelessWidget {
  const TabberLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        id: ConstantController.REFRESH_TABBER,
        builder: (controller) {
          return Container(
            width: MediaQuery.of(context).size.width / 2 - 25,
            child: InkWell(
              onTap: () {
                //改变状态
                ProductDetailController.to.changTabberDirection("left");
              },
              child: Container(
                padding:EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: ProductDetailController.to.getTabberLeftStatus ?Colors.pink:Colors.black12
                        )
                    )
                ),
                child: Text(
                  '详细',
                  style: TextStyle(
                      color:ProductDetailController.to.getTabberLeftStatus ? Colors.pink:Colors.black
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}

/**
 * 右边的tabber
 */
class TabberRight extends StatelessWidget {
  const TabberRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        id:ConstantController.REFRESH_TABBER,
        builder: (controller) {
          return Container(
            width: MediaQuery.of(context).size.width / 2 - 25,
            child: InkWell(
              onTap: () {
                ProductDetailController.to.changTabberDirection("right");
              },
              child: Container(
                padding:EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: ProductDetailController.to.getTabberRightStatus ? Colors.pink:Colors.black12
                        )
                    )
                ),
                child: Text(
                  '评论',
                  style: TextStyle(
                      color:ProductDetailController.to.getTabberRightStatus ? Colors.pink:Colors.black
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}


