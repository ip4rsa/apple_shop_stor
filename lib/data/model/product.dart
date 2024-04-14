// class Prodocts {
//   String id;
//   String collectionId;
//   String description;
//   String thumbnail;
//   int discount_price;
//   int price;
//   String popularity;
//   int quantity;
//   String name;
//   String category;

//   Prodocts(
//     this.collectionId,
//     this.description,
//     this.discount_price,
//     this.id,
//     this.name,
//     this.popularity,
//     this.price,
//     this.quantity,
//     this.thumbnail,
//     this.category,
//   );

//   factory Prodocts.fromJson(Map<String, dynamic> jsonObject) {
//     return Prodocts(
//       jsonObject['id'],
//       jsonObject['collectionId'],
//       jsonObject['description'],
//       jsonObject['thumbnail'],
//       jsonObject['discount_price'],
//       jsonObject['price'],
//       jsonObject['popularity'],
//       jsonObject['quantity'],
//       jsonObject['name'],
//       jsonObject['category'],
//     );
//   }
// }

class Prodocts {
  String id;
  String collectionId;
  String? description;
  String thumbnail;
  int discount_price;
  int price;
  String popularity;
  int quantity;
  String name;
  String? category;
  int? realPrice;
  double? percent;

  Prodocts(
    this.id,
    this.collectionId,
    this.description,
    this.thumbnail,
    this.discount_price,
    this.price,
    this.popularity,
    this.quantity,
    this.name,
    this.category,
  ) {
    realPrice = price + discount_price;
    percent = ((price - realPrice!) / price) * 100;
  }

  factory Prodocts.fromJson(Map<String, dynamic> jsonObject) {
    return Prodocts(
      jsonObject['id'],
      jsonObject['collectionId'],
      jsonObject['description'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['discount_price'],
      jsonObject['price'],
      jsonObject['popularity'],
      jsonObject['quantity'],
      jsonObject['name'],
      jsonObject['category'],
    );
  }
}
