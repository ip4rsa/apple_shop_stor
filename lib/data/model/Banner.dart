class Banners {
  String categoryId;
  String collectionId;
  String thumbnail;
  String id;

  Banners(
    this.categoryId,
    this.collectionId,
    this.thumbnail,
    this.id,
  );

  factory Banners.fromMapJson(Map<String, dynamic> jsonObject) {
    return Banners(
      jsonObject['categoryId'],
      jsonObject['collectionId'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['id'],
    );
  }
}
