class Category {
  Category({
    this.name,
    this.id,
  });

  Category.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
  }

  String? name;
  String? id;

}
