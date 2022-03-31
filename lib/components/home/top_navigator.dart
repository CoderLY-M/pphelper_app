import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pphelper/model/category.dart';

import '../../service/service_api.dart';
/**
 * 首页的导航栏
 */

class TopNavigator extends StatefulWidget {
  const TopNavigator({Key? key}) : super(key: key);

  @override
  _TopNavigatorState createState() => _TopNavigatorState();
}

class _TopNavigatorState extends State<TopNavigator> {
  late List<CategoryModel> navigatorList = [];

  @override
  Widget build(BuildContext context) {
    if(navigatorList != null && navigatorList.length != 0) {
      return Container(
        child: Column(
          children: [
            _recommendTitleWidget(),
            Container(
              height: ScreenUtil().setHeight(320),
              padding: EdgeInsets.all(8.0),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                children: navigatorList.map((item){
                  return _griwViewItemUI(context, item);
                }).toList().cast(),
              ),
            ),
          ],
        ),
      );
    }else{
      return Text("");
    }
  }

  //渲染单个图标
  _griwViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        width: ScreenUtil().setWidth(95),
        padding: EdgeInsets.only(left: 4,right: 4),
        child: Column(
          children: [
            Image.network(item.icon,),
            Text(item.title)
          ],
        ),
      ),
    );
  }

  //标题
  Widget _recommendTitleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
        decoration: BoxDecoration(
            color:Colors.white,
            border: Border(
                bottom: BorderSide(width:0.5,color:Colors.black12)
            )
        ),
        child:Text(
            '商品分类',
            style:TextStyle(color:Colors.blue)
        )
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
        navigatorList = categoryList;
      });
    });
  }
}

