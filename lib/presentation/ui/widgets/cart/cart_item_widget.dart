import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets_path.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title of Product.',
                            style: textTheme.titleMedium,
                          ),
                          _buildColorAndSizeSection(textTheme)
                        ],
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$700',
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                    ItemCount(
                      buttonSizeHeight: 20,
                      buttonSizeWidth: 25,
                      initialValue: 1,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      color: AppColors.themeColor.withOpacity(0.5),
                      onChanged: (value) {},
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildColorAndSizeSection(TextTheme textTheme) {
    return Wrap(
      spacing: 8,
      children: [
        Text(
          'Color: Red',
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        Text(
          'Size: XL',
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        )
      ],
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Image.asset(
        AssetsPath.dummyProductImg,
        height: 80,
        width: 80,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
