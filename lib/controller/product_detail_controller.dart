import 'package:get/get.dart';
import 'package:pphelper/controller/constant_controller.dart';

/**
 *  商品信息数据数据控制器
 */
class ProductDetailController extends GetxController {
  bool _isLeft = true; //是否在左边
  bool _isRight = false; //是否在右边

  static ProductDetailController get to => Get.find();
  //获取tabber左右两边的状态
  bool get getTabberLeftStatus => _isLeft;
  bool get getTabberRightStatus => _isRight;

  //改变tabber的状态
  changTabberDirection(String status) {
    if(status == "left") {
      _isLeft = true;
      _isRight = false;
      //获取详细数据
    }else{
      _isLeft = false;
      _isRight = true;
      //获取评论数据
    }
    update([ConstantController.REFRESH_TABBER]);
  }

}