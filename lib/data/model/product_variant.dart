import 'package:apple_shop/data/model/variant.dart';
import 'package:apple_shop/data/model/variant_type.dart';

class ProductVariant {
  VariantTyoe variantTyoe;
  List<Variant> variantList;

  ProductVariant(this.variantList, this.variantTyoe);
}
