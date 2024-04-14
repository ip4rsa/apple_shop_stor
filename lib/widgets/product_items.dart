import 'package:apple_shop/Screens/product_detail_screen.dart';
import 'package:apple_shop/bloc/products/product_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class productItems extends StatelessWidget {
  Prodocts products;
  productItems(
    this.products, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductDetailsBloc(),
            child: ProductDetailScreen(),
          ),
        ),
      ),
      child: Container(
        height: 216,
        width: 160,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Expanded(child: Container()),
                SizedBox(
                    height: 85,
                    child: CachedImage(imageUrl: products.thumbnail)),
                Positioned(
                  left: 10,
                  top: 0,
                  child: Image.asset(
                    'assets/images/active_fav_product.png',
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 0,
                  child: Container(
                    width: 25,
                    height: 15,
                    decoration: ShapeDecoration(
                      color: red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${products.percent!.round()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    products.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 53,
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Color(0x083B5EDF),
                    //     blurRadius: 2.21,
                    //     offset: Offset(0, 2.77),
                    //     spreadRadius: 0,
                    //   ),
                    //   BoxShadow(
                    //     color: Color(0x0A3B5EDF),
                    //     blurRadius: 5.32,
                    //     offset: Offset(0, 6.65),
                    //     spreadRadius: 0,
                    //   ),
                    //   BoxShadow(
                    //     color: Color(0x0B3B5EDF),
                    //     blurRadius: 10.02,
                    //     offset: Offset(0, 12.52),
                    //     spreadRadius: 0,
                    //   ),
                    //   BoxShadow(
                    //     color: Color(0x0C3B5EDF),
                    //     blurRadius: 17.87,
                    //     offset: Offset(0, 22.34),
                    //     spreadRadius: 0,
                    //   ),
                    //   BoxShadow(
                    //     color: Color(0x0D3B5EDF),
                    //     blurRadius: 33.42,
                    //     offset: Offset(0, 41.78),
                    //     spreadRadius: 0,
                    //   ),
                    //   BoxShadow(
                    //     color: Color(0x113B5EDF),
                    //     blurRadius: 80,
                    //     offset: Offset(0, 100),
                    //     spreadRadius: 0,
                    //   )
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'تومان',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'SM',
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products.realPrice.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: red,
                              ),
                            ),
                            Text(
                              products.price.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/icon_right_arrow_cricle.png',
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
