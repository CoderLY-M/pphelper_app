class ResponseModel {
  late bool success;
  late int code;
  late String message;
  late DataModel data;

  ResponseModel({required this.success, required this.code, required this.message, required this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = (json['data'] != null ? new DataModel.fromJson(json['data']) : null) as DataModel;
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

class DataModel {
  late List<CategoryModel> lists;

  DataModel({required this.lists});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = [];
      json['lists'].forEach((v) {
        lists.add(new CategoryModel.fromJson(v));
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

class CategoryModel {
  late String icon;
  late String id;
  late String title;
  late String parentId;
  late List<SubCategories> subCategories;

  CategoryModel({required this.icon, required this.id, required this.title, required this.parentId, required this.subCategories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    id = json['id'];
    title = json['title'];
    parentId = json['parentId'];
    if (json['subCategories'] != null) {
      subCategories = [];
      json['subCategories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['title'] = this.title;
    data['parentId'] = this.parentId;
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  late String icon;
  late String id;
  late String title;

  SubCategories({required this.icon, required this.id, required this.title});

  SubCategories.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}