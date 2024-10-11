class ProductModel {
  int id;
  String title;
  String description;

  ProductModel({required this.id, required this.title, required this.description});
  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json["id"], title =  json["title"], description =  json["description"];
}