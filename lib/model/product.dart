/**
 * 商品model类
 */
class ResponseModel {
  late bool success;
  late int code;
  late String message;
  late ProductDataModel data;

  ResponseModel({required this.success, required this.code, required this.message, required this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = (json['data'] != null ? new ProductDataModel.fromJson(json['data']) : null) as ProductDataModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ProductDataModel {
  late List<ProductModel> lists;

  ProductDataModel({required this.lists});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = [];
      json['lists'].forEach((v) {
        lists.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lists != null) {
      data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//商品模型
class ProductModel {
  late String productDesc;
  late String productDetail;
  late String sortId;
  late List<String> imageUrl;
  late String id;
  late int viewCount;
  late String productName;
  late int productCount;
  late double productPrice;

  ProductModel(
      {required String productDesc,
        required String productDetail,
        required String sortId,
        required List<String> imageUrl,
        required String id,
        required int viewCount,
        required String productName,
        required int productCount,
        required double productPrice}) {
    this.productDesc = productDesc;
    this.productDetail = productDetail;
    this.sortId = sortId;
    this.imageUrl = imageUrl;
    this.id = id;
    this.viewCount = viewCount;
    this.productName = productName;
    this.productCount = productCount;
    this.productPrice = productPrice;
  }

  ProductModel.fromJson(Map<String, dynamic> json) {
    productDesc = json['productDesc'];
    productDetail = json['productDetail'];
    sortId = json['sortId'];
    imageUrl = json['imageUrl'].cast<String>();
    id = json['id'];
    viewCount = json['viewCount'];
    productName = json['productName'];
    productCount = json['productCount'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productDesc'] = this.productDesc;
    data['productDetail'] = this.productDetail;
    data['sortId'] = this.sortId;
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    data['viewCount'] = this.viewCount;
    data['productName'] = this.productName;
    data['productCount'] = this.productCount;
    data['productPrice'] = this.productPrice;
    return data;
  }
}