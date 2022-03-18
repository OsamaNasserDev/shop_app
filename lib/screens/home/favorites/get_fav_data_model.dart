class GetFavoritesDataModel {
  bool? status;
  String? message;
  Data? data;

  GetFavoritesDataModel({this.status, this.message, this.data});

  GetFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']) ;
  }

}

class Data {
  int? currentPage;
  List<InnerData>? data;
  String? firstPageUrl;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = List.from(json['data']).map((e)=>InnerData.fromJson(e)).toList();

    firstPageUrl = json['first_page_url'];

  }


}

class InnerData {
  num? id;
  Product? product;

  InnerData({this.id, this.product});

  InnerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromJson(json['product']) ;
  }

}

class Product {
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }


}
