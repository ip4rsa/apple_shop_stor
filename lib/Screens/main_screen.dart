import 'dart:ui';
import 'package:apple_shop/Screens/cart_screen.dart';
import 'package:apple_shop/Screens/category_screen.dart';
import 'package:apple_shop/Screens/home_Screen.dart';
import 'package:apple_shop/Screens/profie_screen.dart';
import 'package:apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:apple_shop/bloc/categorys/categorys_bloc.dart';
import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedIndexPage = 3;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authBloc(),
        child: IndexedStack(
          index: selectedIndexPage,
          children: getScreen(),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  selectedIndexPage = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndexPage,
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedLabelStyle:
                  TextStyle(fontFamily: 'SB', fontSize: 10, color: blue),
              unselectedLabelStyle:
                  TextStyle(fontFamily: 'SB', fontSize: 10, color: black),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/icon_profile.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/ic_user_fill.png',
                        height: 25),
                  ),
                  label: 'حساب کاربری',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/icon_basket.png',
                        height: 25),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/icon_basket_active.png',
                        height: 25),
                  ),
                  label: 'سبد خرید',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/icon_category.png',
                        height: 25),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/icon_category_active.png',
                        height: 25),
                  ),
                  label: 'دسته بندی',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child:
                        Image.asset('assets/images/icon_home.png', height: 25),
                  ),
                  label: 'خانه',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/icon_home_active.png',
                        height: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreen() {
  return <Widget>[
    const ProfileScreen(),
    const CartScreen(),
    BlocProvider(
      create: (context) => CategorysBloc(),
      child: const CategoryScreen(),
    ),
    BlocProvider(
      create: (context) => HomeBloc(),
      child: Directionality(
          textDirection: TextDirection.rtl, child: const HomeScreen()),
    )
  ];
}
