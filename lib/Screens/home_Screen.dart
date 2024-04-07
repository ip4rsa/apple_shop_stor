import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/bloc/home/home_event.dart';
import 'package:apple_shop/bloc/home/home_sate.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/model/Banner.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:apple_shop/widgets/category_items_chip.dart';
import 'package:apple_shop/widgets/poster_Slider.dart';
import 'package:apple_shop/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                if (state is HomeLoadind) ...[
                  const SliverPadding(padding: EdgeInsets.only(bottom: 10)),
                  const SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
                const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                //----------------- get data bottm Test
                SliverToBoxAdapter(
                    child: ElevatedButton(
                  onPressed: () async {
                    var response = await ProductRepository().getProducts();
                    response.fold((l) {
                      print(l);
                    }, (r) {
                      r.forEach((element) {
                        print(element.name);
                      });
                    });
                  },
                  child: Text('get data'),
                )),
                _getSearchBob(),
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
                // if (state is HomeResponse) ...[
                //   state.productList.fold((erroreMessage) {
                //     return SliverToBoxAdapter(
                //       child: Text(erroreMessage),
                //     );
                //   }, (listProduct) {
                //     return _getBestSelerProdoctsItems(listProduct);
                //   })
                // ],
                _getBestSelerProdoctsItems(),
                const SliverPadding(padding: EdgeInsets.only(bottom: 35)),
                _getMostViewTitle(),
                const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                _getMostViewProdoctItems(),
                const SliverPadding(padding: EdgeInsets.only(bottom: 35)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _getMostViewProdoctItems extends StatelessWidget {
  const _getMostViewProdoctItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 215,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? 44 : 20),
              child: Text(''),
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
            Image.asset('assets/images/ic_left_category.png', height: 20),
            const SizedBox(width: 10),
            Text(
              'مشاهده همه',
              style: TextStyle(
                color: blue,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              'پر بازدیدترین ها',
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

class _getBestSelerProdoctsItems extends StatelessWidget {
  // List<Prodocts> productsList;
  const _getBestSelerProdoctsItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 215,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 44 : 20, left: index == 9 ? 24 : 0),
              child: productItems(),
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
