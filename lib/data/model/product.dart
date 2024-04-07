class Prodocts {
  String id;
  String collectionId;
  String description;
  String thumbnail;
  int discount_price;
  int price;
  String popularity;
  int quantity;
  String name;
  String category;

  Prodocts(
    this.collectionId,
    this.description,
    this.discount_price,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
    this.category,
  );

  factory Prodocts.fromJson(Map<String, dynamic> jsonObject) {
    return Prodocts(
      jsonObject['id'],
      jsonObject['collectionId'],
      jsonObject['description'],
      jsonObject['thumbnail'],
      jsonObject['discount_price'],
      jsonObject['price'],
      jsonObject['popularity'],
      jsonObject['quantity'],
      jsonObject['name'],
      jsonObject['category'],
    );
  }
}
