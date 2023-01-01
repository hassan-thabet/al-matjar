class OffersModel {
  late String title;
  late String image;

  OffersModel({required this.title, required this.image});

  OffersModel.fromJson(Map<dynamic, dynamic> map) {
    title = map['title'];
    image = map['image'];
  }

  toJson() {
    return {
      'title': title,
      'image': image,
    };
  }
}
