import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/pages/index_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pphelper/router/app_pages.dart';
import 'package:pphelper/router/app_routes.dart';

/**
 * 主启动类
 */

main()=>runApp(Application());

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return GetMaterialApp(
            builder: (context, widget) {
              //add this line
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: FlutterEasyLoading(child: widget,),
              );
            },
            title: "校园二手商城",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.green,
              textTheme: TextTheme(
                //要支持下面这个需要使用第一种初始化方式
                  button: TextStyle(fontSize: 45.sp)
              ),
            ),
            getPages: AppPages.pages,
            home: IndexPage(),
            unknownRoute: AppPages.unKnowPage,
          );
        }
    );
  }
}
