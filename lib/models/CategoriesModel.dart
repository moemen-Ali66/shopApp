class CategoryModel{
  String ?status;
  CategoryDataModel ?data;
  CategoryModel({this.status, this.data});
  CategoryModel.fromJson(Map<String , dynamic>json){
    status=json['status'];
    data=CategoryDataModel.fromJson(json['data']);
  }
}
class CategoryDataModel{
  int ?CurrentPage;
  List <DataModel>? data=[];
  CategoryDataModel.fromJson(Map<String , dynamic>json){
    CurrentPage=json['current_page']??0;
    json['data'].forEach((element){
      data!.add(DataModel.fromJson(element));
    });
  }
  }
class DataModel{
  int ?id;
  String? name;
  String? image;
  DataModel.fromJson(Map<String , dynamic>json){
    id=json['id']??0;
    name=json['name']??'mo';
    image=json['image']??'images/onBoard_1.jpg';
  }
}