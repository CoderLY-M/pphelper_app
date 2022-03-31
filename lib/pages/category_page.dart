import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/components/home/category_nav.dart';

import '../components/category/category_product_view.dart';

/**
 * 分类页面
 */

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品分类"),),
      body: Container(
        child: Row(
          children: [
            LeftCategoryNavigator(),
            Column(
              children: [
                RightSubCategoryNav(),
                CategoryProductView()
              ],
            )
          ],
        ),
      ),
    );

  }
}
