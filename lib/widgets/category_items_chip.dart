import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class categoryItemsChip extends StatelessWidget {
  final Categorys categorys;
  const categoryItemsChip(
    this.categorys, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${categorys.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: ShapeDecoration(
            color: Color(hexColor),
            shadows: [
              BoxShadow(
                color: Color(hexColor).withAlpha(100),
                blurRadius: 20,
                offset: const Offset(0, 5),
              )
            ],
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 23,
              child: CachedImage(imageUrl: categorys.icon),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${categorys.title}' ?? 'محصول',
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        )
      ],
    );
  }
}
