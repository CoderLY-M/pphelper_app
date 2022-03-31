import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pphelper/controller/constant_controller.dart';
import 'package:pphelper/controller/product_controller.dart';
import 'package:pphelper/model/product.dart';

/**
 * 产品页面评论显示
 */

class ProductDetailComment extends StatelessWidget {
  const ProductDetailComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        id: ConstantController.REFRESH_PRODUCT,
        builder: (controller) {
          //当前商品
          ProductModel currentProductModel = ProductController.to.getCurrentProductModel;
          var productDetail = currentProductModel.productDetail;
          return Container(
            child: Html(
              data: productDetail,
            ),
          );
        }
    );
  }
}
