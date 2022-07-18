class FoodData {
  String foo_id;
  String cat_id;
  String foo_name;
  String foo_name_en;
  String foo_price;
  String foo_offer;
  String foo_info;
  String foo_info_en;
  String fav_id;
  String foo_regdate;
  String foo_thumbnail;
  String foo_image;
  FoodData(
      {this.foo_id,
      this.cat_id,
      this.foo_name,
      this.foo_name_en,
      this.foo_price,
      this.foo_offer,
      this.foo_info,
      this.foo_info_en,
      this.fav_id,
      this.foo_regdate,
      this.foo_thumbnail,
      this.foo_image});
  FoodData.fromJson(Map<String, dynamic> json) {
    foo_id = json['foo_id'];
    foo_name = json['foo_name'];
    foo_name_en = json['foo_name_en'];
    foo_price = json['foo_price'];
    foo_offer = json['foo_offer'];
    foo_info = json['foo_info'];
    foo_info_en = json['foo_info_en'];
    fav_id = json['fav_id'];
    foo_thumbnail = json['foo_thumbnail'];
    foo_image = json['foo_image'];}
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foo_id'] = this.foo_id;
    data['foo_name'] = this.foo_name;
    data['foo_name_en'] = this.foo_name_en;
    data['foo_price'] = this.foo_price;
    data['foo_offer'] = this.foo_offer;
    data['foo_info'] = this.foo_info;
    data['foo_info_en'] = this.foo_info_en;
    data['fav_id'] = this.fav_id;
    data['foo_thumbnail'] = this.foo_thumbnail;
    data['foo_image'] = this.foo_image;
    return data;
  }

}
