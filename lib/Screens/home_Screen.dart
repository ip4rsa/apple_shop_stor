import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/bloc/home/home_event.dart';
import 'package:apple_shop/bloc/home/home_sate.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/model/Banner.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:apple_shop/widgets/category_items_chip.dart';
import 'package:apple_shop/widgets/poster_Slider.dart';
import 'package:apple_shop/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeGetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is HomeLoadind) ...{
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // CircularProgressIndicator(
                        //   strokeWidth: 1.2,
                        //   color: blue,
                        // ),
                        Shimmer.fromColors(
                          baseColor: const Color(0xFFEBEBEB),
                          highlightColor: const Color(0xFFFFFFFF),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1,
                            height: MediaQuery.of(context).size.height / 1,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                } else ...{
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                  const _getSearchBob(),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                  if (state is HomeResponse) ...[
                    state.banerList.fold((erroreMessage) {
                      return SliverToBoxAdapter(
                        child: Text(erroreMessage),
                      );
                    }, (listBanner) {
                      const SliverPadding(padding: EdgeInsets.only(bottom: 25));
                      return _getPOsters(listBanner);
                    })
                  ],
                  const SliverPadding(padding: EdgeInsets.only(bottom: 25)),
                  const _getCategoryListTitle(),
                  if (state is HomeResponse) ...[
                    state.categoryList.fold((erroreMessage) {
                      return SliverToBoxAdapter(
                        child: Text(erroreMessage),
                      );
                    }, (listCategorys) {
                      return _getCategoryListItems(listCategorys);
                    })
                  ],
                  const SliverPadding(padding: EdgeInsets.only(bottom: 25)),
                  const _bestSelerProdoctTitle(),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                  if (state is HomeResponse) ...[
                    state.bestSelerProdoct.fold((erroreMessage) {
                      return SliverToBoxAdapter(
                        child: Text(erroreMessage),
                      );
                    }, (listProduct) {
                      return _getBestSelerProdoctsItems(listProduct);
                    })
                  ],
                  // _getBestSelerProdoctsItems(),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 35)),
                  _getMostViewTitle(),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                  if (state is HomeResponse) ...[
                    state.hotestProdoct.fold((erroreMessage) {
                      return SliverToBoxAdapter(
                        child: Text(erroreMessage),
                      );
                    }, (listHotestProdoct) {
                      return _getMostViewProdoctItems(listHotestProdoct);
                    }),
                  ],
                  const SliverPadding(padding: EdgeInsets.only(bottom: 35)),
                },
              ],
            );
          },
        ),
      ),
    );
  }
}

class _getMostViewProdoctItems extends StatelessWidget {
  List<Prodocts> prodoct;
  _getMostViewProdoctItems(
    this.prodoct, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 215,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: prodoct.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 44 : 20, left: index == 2 ? 24 : 0),
              child: productItems(prodoct[index]),
            );
          },
        ),
      ),
    );
  }
}

class _getMostViewTitle extends StatelessWidget {
  const _getMostViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Row(
          children: [
            Text(
              'پر بازدیدترین ها',
              style: TextStyle(
                color: gray,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              'مشاهده همه',
              style: TextStyle(
                color: blue,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset('assets/images/ic_left_category.png', height: 20),
          ],
        ),
      ),
    );
  }
}

class _getBestSelerProdoctsItems extends StatelessWidget {
  List<Prodocts> productsList;
  _getBestSelerProdoctsItems(
    this.productsList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 215,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: productsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 44 : 20, left: index == 2 ? 24 : 0),
              child: productItems(productsList[index]),
            );
          },
        ),
      ),
    );
  }
}

class _bestSelerProdoctTitle extends StatelessWidget {
  const _bestSelerProdoctTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Row(
          children: [
            Text(
              'پر فروش ترین ها',
              style: TextStyle(
                color: gray,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              'مشاهده همه',
              style: TextStyle(
                color: blue,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset('assets/images/ic_left_category.png', height: 20),
          ],
        ),
      ),
    );
  }
}

class _getCategoryListItems extends StatelessWidget {
  List<Categorys> categoryList;
  _getCategoryListItems(
    this.categoryList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 40 : 18,
                  top: 20,
                  left: index == 7 ? 20 : 0),
              child: categoryItemsChip(categoryList[index]),
            );
          },
        ),
      ),
    );
  }
}

class _getCategoryListTitle extends StatelessWidget {
  const _getCategoryListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 43),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'دسته بندی',
              style: TextStyle(
                color: gray,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _getPOsters extends StatelessWidget {
  List<Banners> banners;
  _getPOsters(
    this.banners, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: posterSlider(banners),
    );
  }
}

class _getSearchBob extends StatelessWidget {
  const _getSearchBob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/ic_search.png',
                  height: 26,
                ),
                const SizedBox(width: 10),
                const Text(
                  'جستجوی محصولات',
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 16,
                    fontFamily: 'SM',
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/images/ic_apple_blue.png',
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
