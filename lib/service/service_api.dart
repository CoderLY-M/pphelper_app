import 'dart:collection';

import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'package:pphelper/config/serviceUrl.dart';
import 'package:pphelper/constant/constant.dart';

//获取商品数据
Future requestShopPage(int pageNum, int pageSize) async{
  try{
    var dio = new Dio();
    var response = await dio.get(servicePath['shops'].toString(),queryParameters: {"pageNum": pageNum, "pageSize": pageSize});
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data;
    }else{
      //获取数据失败
      throw Exception("获取商品列表数据错误");
    }
  }catch(e) {
    print("error===========>${e}");
  }
}

//获取录播图图片
Future requestSwiperImages() async {
  try{
    var dio = new Dio();
    var response = await dio.get(servicePath['swiperImages'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data;
    }else{
      throw Exception("获取首页推荐商品失败");
    }
  }catch(e) {
    print("error==============>${e}");
  }
}

//获取分类列表数据
Future requestCategories() async {
  try{
    var dio = new Dio();
    var response = await dio.get(servicePath['categories'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data;
    }else{
      throw Exception("获取商品分类数据失败");
    }
  }catch(e) {
    print("error==============>${e}");
  }
}

//获取推荐商品
Future requestRecommendProducts() async {
  try{
    var dio = new Dio();
    var response = await dio.get(servicePath['recommendProducts'].toString());
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data;
    }else{
      throw Exception("获取首页推荐商品失败");
    }
  }catch(e) {
    print("error==============>${e}");
  }
}

//获取在售商品
Future getSellProducts({int pageNum = DEFAULT_PAGE_NUM, int pageSize = PAGE_SIZE}) async {
  try{
    var dio = new Dio();
    var response = await dio.get(servicePath['sellProducts'].toString(),queryParameters: {"pageSize": pageSize,"pageNum": pageNum});
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data;
    }else{
      throw Exception("获取商品失败");
    }
  }catch(e) {
    print("error==============>${e}");
  }
}

//通过商品分类id获取商品的列表数据
Future getProductsByCategoryId(String categoryId, {int pageNum = DEFAULT_PAGE_NUM, int pageSize = PAGE_SIZE}) async {
  try{
    var dio = new Dio();
    var response = await dio.get(servicePath['getProductsByCategoryId'].toString(),queryParameters: {"cid": categoryId,"pageNum": pageNum, "pageSize": pageSize});
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data;
    }else{
      throw Exception("获取商品分类列表失败");
    }
  }catch(e) {
    print("error==============>${e}");
  }
}

//根据商品id查询商品数据
Future requestGetProductById(String pid) async {
  try{
    var dio = new Dio();
    var response = await dio.get(servicePath['getProductById'].toString(),
        queryParameters: {"pid": pid});
    if(response.statusCode == 200) {
      //获取数据成功
      return response.data;
    }else{
      throw Exception("获取商品数据失败");
    }
  }catch(e) {
    print("error==============>${e}");
  }
}