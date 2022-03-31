
import 'package:get/get.dart';
import 'package:pphelper/model/product.dart';

import '../service/service_api.dart';
import 'constant_controller.dart';

/**
 *  商品数据控制器
 */

class ProductController extends GetxController {
  //当前商品
  late ProductModel _productModel;

  static ProductController get to => Get.find();
  ProductModel get getCurrentProductModel => _productModel;

  //商品数据的改变
  changeCurrentProduct(String pid){
    requestGetProductById(pid).then((item){
      _productModel = ProductModel.fromJson(item["data"]["product"]);
      update([ConstantController.REFRESH_PRODUCT]);
    });
  }
}