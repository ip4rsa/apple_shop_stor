import 'package:apple_shop/data/model/variant.dart';
import 'package:apple_shop/data/model/variant_type.dart';

class ProductVariant {
  VariantTyoe variantType;
  List<Variant> variantList;

  ProductVariant(this.variantType, this.variantList);
}
