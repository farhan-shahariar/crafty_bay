import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.sliderUrl,
  });

  final List<String> sliderUrl;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(
          height: 230,
          showIndicator: true,
          slideIndicator: CircularSlideIndicator(),
          viewportFraction: 1),
      items: sliderUrl.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      scale: 4.8, image: NetworkImage(imageUrl)),
                  color: Colors.blueGrey),
            );
          },
        );
      }).toList(),
    );
  }
}
