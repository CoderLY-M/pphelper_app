import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:pphelper/controller/home_controller.dart';
import 'package:pphelper/service/service_api.dart';

/**
 * 轮播页
 */
class HomeSwiper extends StatefulWidget {
  const HomeSwiper({Key? key}) : super(key: key);

  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  late List imageList = [];

  @override
  Widget build(BuildContext context) {
    if(imageList != null && imageList.length != 0) {
      return Container(
        height: ScreenUtil().setHeight(333),
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return new Image.network("${imageList[index]['imageUrl']}",fit: BoxFit.fill,);
          },
          itemCount: imageList.length,
          scale: 0.7,
          pagination: new SwiperPagination(),
          autoplay: true,
          controller: new SwiperController(),
        ),
      );
    }else{
      return Text("未加载数据");
    }
  }

  @override
  void initState() {
    super.initState();
    loadHomeSwiperImage();
  }

  //获取轮播图数据
  loadHomeSwiperImage() async {
    await requestSwiperImages().then((value){
      setState(() {
        imageList = value["data"]["lists"];
      });
    });
  }
}



