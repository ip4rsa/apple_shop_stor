class VariantTyoe {
  String? id;
  String? name;
  String? title;
  VariantTypeEnum? type;

  VariantTyoe(this.id, this.name, this.title, this.type);

  factory VariantTyoe.fromJson(Map<String, dynamic> jsonObject) {
    return VariantTyoe(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      getTypeEnum(jsonObject['type']),
    );
  }
}

VariantTypeEnum getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.color;
    case 'Storage':
      return VariantTypeEnum.storage;
    case 'Voltage':
      return VariantTypeEnum.storage;
    default:
      return VariantTypeEnum.color;
  }
}

enum VariantTypeEnum { color, storage, voltage }
