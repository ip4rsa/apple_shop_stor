import 'dart:ui';

import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/ic_apple_blue.png',
                          height: 22,
                        ),
                        const Text(
                          'آیفون',
                          style: TextStyle(
                            color: Color(0xFF3B5EDF),
                            fontSize: 16,
                            fontFamily: 'SM',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Icon(Iconsax.arrow_circle_right, size: 26)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 25)),
            const SliverToBoxAdapter(
              child: Text(
                'SE 2022  ایفون',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'SM',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 22),
                child: Container(
                  width: 340,
                  height: 284,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x08000000),
                        blurRadius: 2.21,
                        offset: Offset(0, 2.77),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 5.32,
                        offset: Offset(0, 6.65),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x0B000000),
                        blurRadius: 10.02,
                        offset: Offset(0, 12.52),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Iconsax.star5,
                                color: Colors.amber,
                              ),
                              const Text('4.5'),
                              const Spacer(),
                              SizedBox(
                                  height: double.infinity,
                                  child:
                                      Image.asset('assets/images/iphone.png')),
                              const Spacer(),
                              const Icon(Iconsax.heart_add),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, bottom: 20),
                          child: SizedBox(
                            height: 70,
                            child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          color: Color(0xFF858585),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.asset(
                                          'assets/images/iphone-se-midnight-select-202203 1.png'),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 47),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب رنگ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'SM',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: ShapeDecoration(
                              color: red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: ShapeDecoration(
                              color: blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: ShapeDecoration(
                            color: black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 47),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'انتخاب حافظه داخلی',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'SM',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 74,
                            height: 26,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: black),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '32',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'SM',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 74,
                            height: 26,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: black),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Center(
                              child: Text(
                                '64',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'SM',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 74,
                          height: 26,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: black),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Center(
                            child: Text(
                              '۱۲۸',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 20)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Column(
                  children: [
                    Container(
                      height: 46,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF858585)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Iconsax.arrow_circle_left, color: blue),
                            const SizedBox(width: 10),
                            const Text(
                              'مشاهده',
                              style: TextStyle(
                                color: Color(0xFF3B5EDF),
                                fontSize: 12,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              ':مشخصات فنی',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 46,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF858585)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Iconsax.arrow_circle_left, color: blue),
                            const SizedBox(width: 10),
                            const Text(
                              'مشاهده',
                              style: TextStyle(
                                color: Color(0xFF3B5EDF),
                                fontSize: 12,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              ':توضیخات محصول',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 46,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF858585)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Iconsax.arrow_circle_left, color: blue),
                            const SizedBox(width: 10),
                            const Text(
                              'مشاهده',
                              style: TextStyle(
                                color: Color(0xFF3B5EDF),
                                fontSize: 12,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 26,
                                  height: 26,
                                  decoration: ShapeDecoration(
                                    color: blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 15,
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: ShapeDecoration(
                                      color: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: ShapeDecoration(
                                      color: Colors.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 45,
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: ShapeDecoration(
                                      color: const Color.fromARGB(
                                          255, 65, 186, 107),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: ShapeDecoration(
                                      color: const Color.fromARGB(
                                          255, 109, 109, 109),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '+10',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 7),
                            const Text(
                              ':نظرات کاربران',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'SM',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverPadding(
              padding:
                  EdgeInsets.only(top: 38, left: 40, right: 40, bottom: 32),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    priceButton(),
                    basketButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class basketButton extends StatelessWidget {
  const basketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 47,
          decoration: ShapeDecoration(
            color: Color(0xFF3B5EDF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1)),
                child: const Center(
                  child: Text(
                    'افزودن به سبد خرید',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Sm',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class priceButton extends StatelessWidget {
  const priceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 47,
          decoration: ShapeDecoration(
            color: const Color(0xFF1DB68B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1)),
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
                            '70,000,000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: red,
                            ),
                          ),
                          const Text(
                            '65,000,000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
