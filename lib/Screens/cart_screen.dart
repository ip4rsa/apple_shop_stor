import 'package:apple_shop/constants/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 20),
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
                              'سبد خرید',
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
                SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const cardItems();
                  },
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 75))
              ],
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 53,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'ادامه فرآیند خرید',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'sm',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cardItems extends StatelessWidget {
  const cardItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 239,
      margin: const EdgeInsets.only(right: 44, left: 44, bottom: 23),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x09858585),
            blurRadius: 2.21,
            offset: Offset(0, 2.77),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0B858585),
            blurRadius: 5.32,
            offset: Offset(0, 4.99),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C858585),
            blurRadius: 10.02,
            offset: Offset(0, 12.52),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0D858585),
            blurRadius: 17.87,
            offset: Offset(0, 16.75),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0D858585),
            blurRadius: 33.42,
            offset: Offset(0, 41.78),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x11858585),
            blurRadius: 80,
            offset: Offset(0, 20),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'مک بوک پرو M1 یک ترابایت',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'SM',
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            'گارانتی 18 ماه مدیا پردازش',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 10,
                              fontFamily: 'SM',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 25,
                                height: 15,
                                decoration: ShapeDecoration(
                                  color: red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.50),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    '%9',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text('تومان'),
                              const SizedBox(width: 5),
                              const Text('95,000,000'),
                            ],
                          ),
                          SizedBox(height: 10),
                          const Wrap(
                            children: [
                              optionChip(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/images/MacBook.png', height: 70),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DottedLine(
                lineThickness: 1,
                dashLength: 6,
                dashColor: gray.withOpacity(.5),
                dashGapLength: 3,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تومان',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'sm',
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '93,000,000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'sm',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class optionChip extends StatelessWidget {
  const optionChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 24,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFE5E5E5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Iconsax.arrow_down_1, color: gray, size: 17),
          const Text(
            '1 ترابایت',
            style: TextStyle(
              color: Color(0xFF858585),
              fontSize: 10,
              fontFamily: 'sm',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
