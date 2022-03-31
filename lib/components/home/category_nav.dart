import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/controller/category_controller.dart';
import '../../controller/constant_controller.dart';
import '../../model/category.dart';
import '../../service/service_api.dart';

/**
 * 分类导航页
 */

class LeftCategoryNavigator extends StatefulWidget {
  const LeftCategoryNavigator({Key? key}) : super(key: key);

  @override
  _LeftCategoryNavigatorState createState() => _LeftCategoryNavigatorState();
}

class _LeftCategoryNavigatorState extends State<LeftCategoryNavigator> {
  late List<CategoryModel> categoryList = [];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          return Container(
            width: MediaQuery.of(context).size.width / 5,
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1,color:Colors.black12)
                )
            ),
            child: ListView.builder(
              itemCount:categoryList.length,
              itemBuilder: (context,index){
                return _categoryWidget(index);
              },
            ),
          );
        }
    );
  }

  //父类组件
  Widget _categoryWidget(index) {
    bool isCheck = false;
    isCheck =(index == currentIndex) ? true : false;
    return InkWell(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
        Get.find<CategoryController>().changeSubCategoryList(categoryList[index].subCategories);
      },
      child: Container(
        height: ScreenUtil().setHeight(80),
        padding:const EdgeInsets.only(left:10,top:20),
        decoration: BoxDecoration(
          color: isCheck ? Colors.black12 : Colors.white,
          border:const Border(
              bottom:BorderSide(width: 1,color:Colors.black12)
          )
        ),
        child: Text(
          categoryList[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:ScreenUtil().setSp(28),
            height: ScreenUtil().setHeight(1.5),
            ),
          ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadCategoryList();
  }

  //获取分类列表
  loadCategoryList() async {
    await requestCategories().then((value){
      var dataModel = DataModel.fromJson(value["data"]);
      var categoryList = dataModel.lists;
      setState(() {
        this.categoryList = categoryList;
      });
    });
    //设置子分类列表
    var subCategories = categoryList[0].subCategories;
    initSubCategoryProductView(subCategories);
  }

  //初始化显示
  initSubCategoryProductView (var items) {
    Get.find<CategoryController>().changeSubCategoryList(items);
    Get.find<CategoryController>().changeCategoryProductList(items[0].id);
    Get.find<CategoryController>().changePageNum();
    Get.find<CategoryController>().changeCategoryId(items[0].id);
  }
}

//小类的导航
class RightSubCategoryNav extends StatefulWidget {
  const RightSubCategoryNav({Key? key}) : super(key: key);

  @override
  _RightSubCategoryNavState createState() => _RightSubCategoryNavState();
}

class _RightSubCategoryNavState extends State<RightSubCategoryNav> {
  int currentSubIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        id: ConstantController.REFRESH_SUBCATEGORY_LIST,
        builder: (controller) {
          return Container(
            height: ScreenUtil().setHeight(80),
            width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width / 5,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12)
              )
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Get.find<CategoryController>().getSubCategoryList.length,
              itemBuilder: (context, index) {
                return _subCategoryWidget(Get.find<CategoryController>().getSubCategoryList[index],index);
              }
            ),
          );
        }
    );
  }

  //单个子类显示
  Widget _subCategoryWidget(item,index) {
    bool isChecked = false;
    isChecked = (currentSubIndex == index) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          currentSubIndex = index;
        });
        Get.find<CategoryController>().changePageNum();
        Get.find<CategoryController>().changeCategoryProductList(item.id);
        Get.find<CategoryController>().changeCategoryId(item.id);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Text(
          "${item.title}",
          style: TextStyle(
            color: isChecked ? Colors.blue : Colors.grey,
            fontSize: ScreenUtil().setSp(28),
            height: ScreenUtil().setHeight(2.5),
          ),
        ),
      ),
    );
  }
}


