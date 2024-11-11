import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchTextField(
                textEditingController: TextEditingController(),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeBannerSlider(),
              const SizedBox(
                height: 16,
              ),
              _buildCategoriesSection(),
              const SizedBox(
                height: 16,
              ),
              _buildPopularProductSection(),
              const SizedBox(
                height: 16,
              ),
              _buildNewProductSection(),
              const SizedBox(
                height: 16,
              ),
              _buildSpecialProductSection(),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Categories',
          onTap: () {
            Get.find<BottomNavBarController>().selectCategory();
          },
        ),
        const SizedBox(
          height: 120,
          child: HorizontalCategoriesListView(),
        ),
      ],
    );
  }

  Widget _buildPopularProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Popular',
          onTap: () {},
        ),
        const SizedBox(
          height: 170,
          child: HorizontalProductListView(),
        ),
      ],
    );
  }

  Widget _buildNewProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: () {},
        ),
        const SizedBox(
          height: 170,
          child: HorizontalProductListView(),
        ),
      ],
    );
  }

  Widget _buildSpecialProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: () {},
        ),
        const SizedBox(
          height: 170,
          child: HorizontalProductListView(),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppBarIconButton(
          iconData: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 16,
        ),
        AppBarIconButton(
          iconData: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 16,
        ),
        AppBarIconButton(
          iconData: Icons.notifications,
          onTap: () {},
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
