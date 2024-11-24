import 'package:crafty_bay/data/model/category_model.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();

}


class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListByCategoryController>().getProductListByCategory(widget.category.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.categoryName ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GetBuilder<ProductListByCategoryController>(
          builder: (productListByCategoryController) {
            if(productListByCategoryController.inProgress){
              return const CenteredCircularProgressIndicator();
            } else if(productListByCategoryController.errorMessage != null){
              return Center(
                child: Text(productListByCategoryController.errorMessage!),
              );
            } else if(productListByCategoryController.productList.isEmpty){
              return const Center(
                child: Text('No product available right now !'),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
              itemCount: productListByCategoryController.productList.length,
              itemBuilder: (context, index) {
                return FittedBox(child: ProductCard(productModel: productListByCategoryController.productList[index],));
              },
            );
          }
        ),
      ),
    );
  }
}
