class HomeModel{
  bool? status;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String , dynamic> json){
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel{

   List<BannersModel>? banners ;
   List<ProductsModel>? products ;
  HomeDataModel.fromJson(Map<String , dynamic> json){
    banners = List.from(json['banners']).map((e)=>BannersModel.fromJson(e)).toList();
    products = List.from(json['products']).map((e)=>ProductsModel.fromJson(e)).toList();
  }

}

class BannersModel {
  int? id ;
  String? image ;
  BannersModel.fromJson(Map<String , dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}

class ProductsModel {
   int? id;
   num? price;
   num? oldPrice;
   num? discount;
   String? image;
   String? name;
   bool? inFavorites;
   bool? inCart;

  ProductsModel.fromJson(Map<String , dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  }