import 'package:get/get.dart';
import 'package:pphelper/model/category.dart';
import 'package:pphelper/controller/constant_controller.dart';
import 'package:pphelper/model/product.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import '../constant/constant.dart';
import '../service/service_api.dart';


/**
 * 分类数据控制器
 */

class CategoryController extends GetxController {
  //子分类列表
   late List<SubCategories> _subCategoryList = [];
   //子分类的商品列表
   late List<ProductModel> _categoryProductList = [];
   //当前的分类列表id
   late String _categoryId = "";
   //当前页数
   late int _pageNum = 1;
   //是否还有数据加载
   late bool _hasData = true;

   List<SubCategories> get getSubCategoryList => _subCategoryList;
   List<ProductModel> get getCategoryProductList => _categoryProductList;
   String get getCategoryId => _categoryId;
   int get getPageNum => _pageNum;
   bool get getHasData => _hasData;

   //分类列表的改变
  changeSubCategoryList(List<SubCategories> lists){
    _subCategoryList = lists;
    update([ConstantController.REFRESH_SUBCATEGORY_LIST]);
  }
  //分类列表商品的改变
  changeCategoryProductList(String cid) {
    //通过分类id查询分类商品数据
    getProductsByCategoryId(cid,pageNum: _pageNum).then((value){
      var dataModel = ProductDataModel.fromJson(value["data"]);
      if(dataModel.lists.length != 0){
        // 无数据
        _categoryProductList.addAll(dataModel.lists) ;
        update([ConstantController.REFRESH_SUBCATEGORY_PRODUCT_LIST, ConstantController.HAS_DATA]);
      }else{
        // Fluttertoast.showToast(
        //     msg:"没有更多数据了...",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
      }
    });
  }
  //分类id的改变
   changeCategoryId(String cid){
     _categoryId = cid;
     update([ConstantController.REFRESH_SUBCATEGORY_ID]);
   }
   //页码的改变
   changePageNum({int pageNum = DEFAULT_PAGE_NUM}){
     _pageNum = pageNum;
     update([ConstantController.PAGE_NUM]);
   }
}