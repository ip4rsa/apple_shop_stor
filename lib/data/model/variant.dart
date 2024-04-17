class Variant {
  String? id;
  String? name;
  String? typeId;
  String? value;
  String? priceChange;

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
      jsonObject['value'],
      jsonObject['price_change'],
      jsonObject['type_id'],
    );
  }
}
