class Categorys {
  String? color;
  String? icon;
  String? thumbnail;
  String? title;
  String? id;
  String? collectionId;

  Categorys(
    this.collectionId,
    this.color,
    this.icon,
    this.id,
    this.thumbnail,
    this.title,
  );

  factory Categorys.fromMapJson(Map<String, dynamic> jsonObject) {
    return Categorys(
      jsonObject['collectionId'],
      jsonObject['color'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',
      jsonObject['id'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['title'],
    );
  }
}
