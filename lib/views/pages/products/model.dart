class ProductsData {
  late final bool status;
  late final String msg;
  late final Data data;

  ProductsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.records,
  });

  late final List<Records> records;

  Data.fromJson(Map<String, dynamic> json) {
    records =
        List.from(json['records']).map((e) => Records.fromJson(e)).toList();
  }
}

class Records {
  late final int id;
  late final String title;
  late final String image;
  late final String price;
  late final String description;
  late final String active;
  late final String categoryId;
  late final String createdAt;
  late final String updatedAt;

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    active = json['active'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
