import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(
          height: 230,
          showIndicator: true,
          slideIndicator: CircularSlideIndicator(),
          viewportFraction: 1),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      scale: 4.8,
                      image: AssetImage(
                        AssetsPath.dummyProductImg,
                      )),
                  color: Colors.blueGrey),
            );
          },
        );
      }).toList(),
    );
  }
}
