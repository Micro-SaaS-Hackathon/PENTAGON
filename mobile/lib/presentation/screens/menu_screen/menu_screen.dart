import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_mizza_saas/presentation/widgets/app_titles.dart';
import 'package:pizza_mizza_saas/utils/constants/app_assets.dart';
import 'package:pizza_mizza_saas/utils/constants/app_colors.dart';
import 'package:pizza_mizza_saas/utils/constants/app_paddings.dart';
import 'package:pizza_mizza_saas/utils/constants/app_radiuses.dart';
import 'package:pizza_mizza_saas/utils/extensions/screen_size_extension.dart';
import 'package:pizza_mizza_saas/utils/extensions/sized_box_extension.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // A function to show the bottom sheet
  void _showBasketBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to be full-screen
      builder: (BuildContext context) {
        return Container(
          height:
              MediaQuery.of(context).size.height *
              0.7, // Adjust height as needed
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              "Your Basket Content Goes Here",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

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
        actions: [
          GestureDetector(
            onTap: () {
              // Call the function to show the bottom sheet
              _showBasketBottomSheet(context);
            },
            child: Padding(
              padding: AppPaddings.r12,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(AppAssets.basketIcon, height: 30),
                  Positioned(
                    top: -5,
                    right: -5,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: AppPaddings.a16,
            child: GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.46,
              ),
              itemBuilder: (_, index) {
                // final data = homeGridData[index];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: AppRadiuses.a20,
                    border: Border.all(color: AppColors.borderGray),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.25 * context.screenHeight,
                        child: SvgPicture.asset(AppAssets.pizza),
                      ),
                      Padding(
                        padding: AppPaddings.h12,
                        child: Column(
                          children: [
                            4.h,
                            AppTitles(
                              title: "title",
                              fSize: 16,
                              fWeight: FontWeight.w600,
                            ),
                            6.h,
                            AppTitles(
                              title:
                                  "description,description,description,description,description",
                              fWeight: FontWeight.w500,
                              color: AppColors.customGray,
                            ),
                            20.h,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTitles(
                                  title: "12 AZN",
                                  fWeight: FontWeight.w600,
                                  fSize: 16,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: AppPaddings.h1,
                                    backgroundColor: AppColors.customRed,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: AppRadiuses.a10,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.plusIcon,
                                        height: 24,
                                      ),
                                      AppTitles(
                                        title: "Add",
                                        color: AppColors.white,
                                        fWeight: FontWeight.w600,
                                        fSize: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
