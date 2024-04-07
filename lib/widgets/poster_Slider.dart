import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/model/Banner.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class posterSlider extends StatelessWidget {
  posterSlider(this.bannerList, {super.key});
  List<Banners> bannerList;
  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: .88);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 177,
          child: PageView.builder(
            itemCount: bannerList.length,
            controller: controller,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedImage(imageUrl: bannerList[index].thumbnail),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 23,
          child: SmoothPageIndicator(
            textDirection: TextDirection.rtl,
            controller: controller,
            count: 4,
            effect: ExpandingDotsEffect(
              dotWidth: 7,
              dotHeight: 7,
              expansionFactor: 4,
              dotColor: lightWhite,
              activeDotColor: blue,
            ),
          ),
        )
      ],
    );
  }
}
