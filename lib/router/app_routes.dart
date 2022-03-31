import 'package:get/get.dart';
import 'package:pphelper/pages/home_page.dart';
import 'package:pphelper/pages/category_page.dart';
import 'package:pphelper/pages/message_page.dart';
import 'package:pphelper/pages/person_page.dart';
import 'package:pphelper/pages/bus_page.dart';
import 'package:pphelper/pages/product_detail.dart';
import 'package:pphelper/pages/unknow_page.dart';
import 'package:pphelper/router/app_pages.dart';

/**
 * app路由
 */
abstract class AppPages {
  static final pages = [
    //首页
    GetPage(
        name: Routes.HOME,
        page: () => HomePage()
    ),
    //分类
    GetPage(
        name: Routes.CAEGORY,
        page: () => CategoryPage()
    ),
    //消息
    GetPage(
        name: Routes.MESSAGE,
        page: () => MessagePage()
    ),
    //购物车
    GetPage(
        name: Routes.BUS,
        page: () => BusPage()
    ),
    //个人中心
    GetPage(
        name: Routes.PERSON,
        page: () => PersonPage()
    ),
    //商品详情页
    GetPage(
        name: Routes.PRODUCT_DETAIL,
        page: () => ProductDetail()
    ),
  ];

  //404页面
  static final unKnowPage = GetPage(
      name: Routes.UN_KNOW_PAGE,
      page: () => UnKnowPage()
  );
}