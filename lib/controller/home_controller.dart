
import 'package:get/get.dart';

import '../service/service_api.dart';

/**
 * 首页数据控制器
 */
class HomeController extends GetxController {
  //轮播图列表
   RxList _swiperList = [].obs;

   //获取轮播图数据
   RxList get getSwiperList => _swiperList;

   @override
  void onInit() {
    super.onInit();
    loadSwiperList();
  }

   //加载轮播图数据
  void loadSwiperList () async{
    await requestSwiperImages().then((value){
      _swiperList = value["data"]["lists"];
    });
  }
}