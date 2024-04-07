import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/widgets/category_items_chip.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
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
                        'حساب کاربری',
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
            const SizedBox(height: 12),
            const Text(
              'پارسا سجادیان',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'sb',
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '09223744948',
              style: TextStyle(
                color: Color(0xFF858585),
                fontSize: 11,
                fontFamily: 'FM',
              ),
            ),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                child: Wrap(
                  runSpacing: 22,
                  spacing: 26,
                  children: [
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                    // categoryItemsChip(),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text(
              'اپل شاپ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: gray,
                fontSize: 10,
                fontFamily: 'SM',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'V-1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: gray,
                fontSize: 10,
                fontFamily: 'GM',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
