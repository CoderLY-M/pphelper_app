//根路径
const serviceUrl = "http://192.168.1.108:8899/pphelper";

//请求地址
var servicePath = {
  "homePage": serviceUrl + "/home",
  "shops": serviceUrl + "/home/shops", //获取商品数据
  "swiperImages":  serviceUrl + "/product/swiperImages",  //获取录播图商品
  "recommendProducts":  serviceUrl + "/product/recommendProducts",  //获取推荐商品
  "categories":  serviceUrl + "/category/getCategories",  //获取分类
  "sellProducts":  serviceUrl + "/product/sellProducts",  //获取在售商品
  "getProductsByCategoryId":  serviceUrl + "/product/getProductsByCategoryId",  //通过分类id获取商品列表
  "getProductById":  serviceUrl + "/product/getProductById",  //通过商品id获得商品数据
  "messagePage": serviceUrl + "/message",
  "cartPage": serviceUrl + "/cart",
  "member": serviceUrl + "/member",
};


