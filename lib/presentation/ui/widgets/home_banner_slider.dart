import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        visible: !sliderListController.inProgress,
        replacement: const SizedBox(
          height: 200,
          child: CenteredCircularProgressIndicator(),
        ),
        child: FlutterCarousel(
          options: FlutterCarouselOptions(
            height: 200,
            showIndicator: true,
            slideIndicator: CircularSlideIndicator(),
            viewportFraction: 1,
          ),
          items: sliderListController.sliders.map(
            (slider) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                slider.price ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColors.themeColor,
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: const Text('Buy Now'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
      );
    });
  }
}
