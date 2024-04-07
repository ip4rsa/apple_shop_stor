import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/widgets/product_items.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_apple_blue.png',
                          height: 22,
                        ),
                        const Spacer(),
                        Text(
                          'پرفروش ترین ها',
                          style: TextStyle(
                            color: blue,
                            fontSize: 16,
                            fontFamily: 'SM',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // return  productItems();
                    return Text('data');
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.9,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
