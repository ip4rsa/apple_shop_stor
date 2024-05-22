class Variant {
  String? id;

  String? name;

  String? typeId;

  String? value;

  int? priceChange;

  Variant(
    this.id,
    this.name,
    this.priceChange,
    this.typeId,
    this.value,
  );

  factory Variant.fromJson(Map<String, dynamic> jsonObject) {
    return Variant(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['price_change'],
      jsonObject['type_id'],
      jsonObject['value'],
    );
  }
}
