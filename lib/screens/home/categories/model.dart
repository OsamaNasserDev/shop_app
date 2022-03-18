class CategoriesModel {
  CategoriesModel({
    required this.status,
    required this.categoriesData,
  });
  bool? status;
  CategoriesData? categoriesData;

  CategoriesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    categoriesData = CategoriesData.fromJson(json['data']);
  }

}

class CategoriesData {
  CategoriesData({
    required this.currentPage,
    required this.categoriesData,

  });
  int? currentPage;
  List<DataModel>? categoriesData;


  CategoriesData.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    categoriesData = List.from(json['data']).map((e)=>DataModel.fromJson(e)).toList();

  }

}
class DataModel {
  int? id ;
  String? name ;
  String? image ;
  DataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}