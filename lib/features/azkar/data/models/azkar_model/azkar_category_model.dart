class AzkarCategoryModel {
  int? id;
  String? name;
  AzkarCategoryModel(this.id, this.name);

  AzkarCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}