class CategoryModel {
  int id;
  String title;
  String img;
  String date;

  CategoryModel({this.id, this.title, this.img, this.date});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    data['date'] = this.date;
    return data;
  }
}
