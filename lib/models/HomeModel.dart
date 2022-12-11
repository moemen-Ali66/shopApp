class HomeModel {
  bool ?status;
  HomeDataModel ?data;
  HomeModel({this.status, this.data});
  HomeModel.fromJson(Map <String,dynamic> json){
    status=json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
  }


class HomeDataModel{
  List<BannerModel>banners=[];
  List<ProductModel>products=[];
  HomeDataModel.fromJson(Map<String,dynamic>json){
    json['banners'].forEach((element){
      banners.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element){
      products.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel{
  int ?id;
  String ?image;
  BannerModel.fromJson(Map<String,dynamic>json){
    id=json['id']??0;
    image=json['image']??'onBoard_1.jpg';
  }
}
class ProductModel{
  int ? id;
  dynamic ? price;
  dynamic ? oldPrice;
  dynamic ? discount;
  String ?image;
  String ?name;
  bool ?in_favorite;
  bool ?in_Cart;
  ProductModel.fromJson(Map<String,dynamic>json){
    id=json['id']??0;
    price=json['price']??0;
    oldPrice=json['old_price']??0;
    discount=json['discount']??0;
    image=json['image']??'onBoard_1.jpg';
    name=json['name']??'mo';
    in_favorite=json['in_favorites']??true;
    in_Cart=json['in_cart']??true;
  }
}