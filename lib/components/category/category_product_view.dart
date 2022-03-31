import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/components/product/product_item.dart';
import '../../controller/category_controller.dart';
import '../../controller/constant_controller.dart';
import 'package:pphelper/router/app_routes.dart';

/**
 * 商品分类页商品展示
 */
class CategoryProductView extends StatelessWidget {
  const CategoryProductView({Key? key}) : super(key: key);

  //商品纵向组件
  Widget _verticalProductWidget() {
    return MasonryGridView.count(
      // 展示几列
      crossAxisCount: 2,
      // 元素总个数
      itemCount: Get.find<CategoryController>().getCategoryProductList.length,
      // 单个子元素
      itemBuilder: (BuildContext context, int index) => ProductItem(item: Get.find<CategoryController>().getCategoryProductList[index],),
      // 纵向元素间距
      mainAxisSpacing: 10,
      // 横向元素间距
      crossAxisSpacing: 10,
      //本身不滚动，让外面的singlescrollview来滚动
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true, //收缩，让元素宽度自适应
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CategoryController(),
        id: ConstantController.REFRESH_SUBCATEGORY_PRODUCT_LIST,
        builder: (controller) {
          return Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width / 5,
                height: ScreenUtil().setHeight(200),
                child: EasyRefresh(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      _verticalProductWidget()
                    ],
                  ),
                  onLoad: () async {
                    //获取子类的cid
                    var currentCid = Get.find<CategoryController>().getCategoryId;
                    var pageNum = Get.find<CategoryController>().getPageNum;
                    Get.find<CategoryController>().changePageNum(pageNum: ++pageNum);
                    Get.find<CategoryController>().changeCategoryProductList(currentCid);
                  },
                  footer: BallPulseFooter(),
                )
              )
          );
        }
    );
  }
}
