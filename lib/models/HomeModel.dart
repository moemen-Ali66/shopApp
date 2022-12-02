class HomeModel {
  String ?status;
  HomeDataModel ?data;
  HomeModel.fromJson(Map <String,dynamic> json){
    status=json['status'];
    data=json['data'];
  }
}

class HomeDataModel{
  List<BannerModel>banners=[];
  List<ProductModel>products=[];
  HomeDataModel.fromJson(Map<String,dynamic>json){
    json['banners'].forEach((element){
      banners.add(element);
    });
    json['products'].forEach((element){
      products.add(element);
    });
  }
}

class BannerModel{
  int ? id;
  String ?image;
  BannerModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    image=json['image'];
  }
}
class ProductModel{
  int ? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String ?image;
  String ?name;
  bool ?in_favorite;
  bool ?in_Cart;
  ProductModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    in_favorite=json['in_favorites'];
    in_Cart=json['in_cart'];
  }
}