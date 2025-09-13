import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_mizza_saas/presentation/screens/menu_screen/menu_grid_items.dart';
import 'package:pizza_mizza_saas/presentation/widgets/app_titles.dart';
import 'package:pizza_mizza_saas/utils/constants/app_assets.dart';
import 'package:pizza_mizza_saas/utils/constants/app_colors.dart';
import 'package:pizza_mizza_saas/utils/constants/app_paddings.dart';
import 'package:pizza_mizza_saas/utils/constants/app_radiuses.dart';
import 'package:pizza_mizza_saas/utils/extensions/sized_box_extension.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        title: Row(
          children: [
            SvgPicture.asset(AppAssets.pizzaMizzaLogoSvg, height: 20),
            10.w,
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppRadiuses.a30,
                shape: BoxShape.rectangle,
                color: AppColors.customGreen,
              ),
              child: Padding(
                padding: AppPaddings.a6,
                child: AppTitles(
                  title: "Fresh",
                  fWeight: FontWeight.w600,
                  fSize: 16,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: AppPaddings.a20,
            child: GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 19,
                mainAxisSpacing: 19,
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (_, index) {
                // final data = homeGridData[index];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: AppRadiuses.a20,
                    border: Border.all(color: AppColors.borderGray),
                  ),
                );
              },
            ),
          ),
          SvgPicture.asset(AppAssets.pizza),
        ],
      ),
    );
  }
}
