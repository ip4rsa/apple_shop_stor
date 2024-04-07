import 'package:apple_shop/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  CachedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? 'reeore photo',
        fit: BoxFit.cover,
        // placeholder: (context, url) => Container(color: blue),
        errorWidget: (context, url, error) => Container(color: red),
      ),
    );
  }
}
