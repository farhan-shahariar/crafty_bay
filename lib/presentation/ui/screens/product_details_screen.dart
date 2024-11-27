import 'package:crafty_bay/data/model/product_details_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:crafty_bay/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
        ),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CenteredCircularProgressIndicator();
        }
        if (productDetailsController.errorMessage != null) {
          return Center(
            child: Text(productDetailsController.errorMessage!),
          );
        }
        return Column(
          children: [
            Expanded(
              child:
                  _buildProductDetails(productDetailsController.productModel!),
            ),
            _buildPriceAndAddToCartSection(
                productDetailsController.productModel!)
          ],
        );
      }),
    );
  }

  Widget _buildProductDetails(ProductDetailsModel productModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageSlider(
            sliderUrl: [
              productModel.img1!,
              productModel.img2!,
              productModel.img3!,
              productModel.img4!,
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndQuantitySection(productModel),
                const SizedBox(
                  height: 4,
                ),
                _buildRatingAndReviewSection(productModel),
                const SizedBox(
                  height: 8,
                ),
                // ColorPicker(
                //   colors: const [
                //     Colors.blue,
                //     Colors.deepOrange,
                //     Colors.pinkAccent,
                //     Colors.lime
                //   ],
                //   onColorSelected: (colors) {},
                // ),
                ColorPicker(
                    color: productModel.color!.split(','),
                    onColorSelected: (size) {}),
                const SizedBox(
                  height: 16,
                ),
                SizePicker(
                    size: productModel.size!.split(','),
                    onSizeSelected: (size) {}),
                const SizedBox(
                  height: 16,
                ),
                _buildDescriptionSection(productModel)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(ProductDetailsModel productModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          productModel.product?.shortDes ?? '',
          style: const TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection(ProductDetailsModel productModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          productModel.product?.title ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        )),
        const SizedBox(
          width: 4,
        ),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor.withOpacity(0.5),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection(ProductDetailsModel productModel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '${productModel.product?.star ?? ''}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Reviews',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.themeColor,
              ),
            )),
        const SizedBox(
          width: 8,
        ),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(2),
            child: Icon(
              Icons.favorite_border,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel productModel) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          )),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price'),
              Text(
                '\$${productModel.product?.price}',
                style: const TextStyle(
                  color: AppColors.themeColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
              width: 120,
              child: ElevatedButton(
                  onPressed: _onTapAddToCart, child: const Text('Add To Cart')))
        ],
      ),
    );
  }

  Future<void> _onTapAddToCart() async {
    bool isLoggedInUser = await Get.find<AuthController>().isLoggedInUser();
    if (isLoggedInUser) {
    } else {
      Get.to(() => const EmailVerificationScreen());
    }
  }
}
