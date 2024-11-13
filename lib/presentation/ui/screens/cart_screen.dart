import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_bar_controller.dart';
import '../widgets/cart/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        backToHome();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const CartItemWidget();
                },
              ),
            ),
            _buildPriceAndCheckoutSection(),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckoutSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$14000',
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
                  onPressed: () {}, child: const Text('Checkout')))
        ],
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
