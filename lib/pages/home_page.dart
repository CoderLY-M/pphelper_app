import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pphelper/components/home/home_swiper.dart';
import 'package:pphelper/components/home/top_navigator.dart';
import 'package:pphelper/components/home/product_recommend.dart';
import 'package:pphelper/components/category/products_list.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../service/service_api.dart';

/**
 * 首页
 */

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNum = 1;
  List productLists = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("校园二手交易平台"),centerTitle: true,),
        body: EasyRefresh(
          child: ListView(
            children: [
              HomeSwiper(),
              TopNavigator(),
              ProductRecommend(),
              ProductsList(productLists: this.productLists,),
            ],
          ),
          onLoad: () async {
            await getSellProducts(pageNum: pageNum).then((value){
              setState(() {
                productLists.addAll(value["data"]["lists"]);
                pageNum++;
              });
            });
          },
          header: BallPulseHeader(),
          footer: BallPulseFooter(),
        )
      ),
    );
  }
}


