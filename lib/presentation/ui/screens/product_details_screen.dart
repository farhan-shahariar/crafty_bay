import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:crafty_bay/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildProductDetails(),
          ),
          _buildPriceAndAddToCartSection()
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndQuantitySection(),
                const SizedBox(
                  height: 4,
                ),
                _buildRatingAndReviewSection(),
                const SizedBox(
                  height: 8,
                ),
                ColorPicker(
                  colors: const [
                    Colors.blue,
                    Colors.deepOrange,
                    Colors.pinkAccent,
                    Colors.lime
                  ],
                  onColorSelected: (colors) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                SizePicker(
                    size: const ['S', 'M', 'L', 'XL', 'XXL'],
                    onSizeSelected: (size) {}),
                const SizedBox(
                  height: 16,
                ),
                _buildDescriptionSection()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
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
        const Text(
          '''The ASUS VivoBook with an Intel Core i5 8th Gen processor is a versatile laptop ideal for everyday computing. It offers a sleek design, decent performance for multitasking, and a full HD display for an immersive viewing experience. With its lightweight build and solid battery life, it’s a good choice for students and professionals on the go. ''',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          'Asus Vivobook - core i5 - 8th Generation - New Year Special Deal',
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

  Widget _buildRatingAndReviewSection() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '4.5',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
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

  Widget _buildPriceAndAddToCartSection() {
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$700',
                style: TextStyle(
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
                  onPressed: () {}, child: const Text('Add To Cart')))
        ],
      ),
    );
  }
}
