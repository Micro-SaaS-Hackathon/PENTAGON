import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_mizza_saas/cubits/basket/basket_cubit.dart';
import 'package:pizza_mizza_saas/cubits/products/products_cubit.dart';
import 'package:pizza_mizza_saas/presentation/widgets/app_titles.dart';
import 'package:pizza_mizza_saas/presentation/widgets/custom_elevated_button.dart';
import 'package:pizza_mizza_saas/utils/constants/app_assets.dart';
import 'package:pizza_mizza_saas/utils/constants/app_colors.dart';
import 'package:pizza_mizza_saas/utils/constants/app_paddings.dart';
import 'package:pizza_mizza_saas/utils/constants/app_radiuses.dart';
import 'package:pizza_mizza_saas/utils/extensions/screen_size_extension.dart';
import 'package:pizza_mizza_saas/utils/extensions/sized_box_extension.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // A function to show a dialog
  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Order Submitted!"),
          content: Text("Thank you for your order! It will be delivered soon."),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(dialogContext).pop();
                // Optionally, close the bottom sheet as well
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // A function to show the bottom sheet
  void _showBasketBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: context.screenWidth,
          height: 0.5 * context.screenHeight,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: AppPaddings.a14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("order 1"),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      text: "Submit Order",
                      onPressed: () {
                        // Call the function to show the dialog
                        _showOrderConfirmationDialog(context);
                      },
                      borderRadius: AppRadiuses.a12,
                      backgroundColor: AppColors.customRed,
                      textColor: AppColors.white,
                      fSize: 16,
                    ),
                  ],
                ),
              ],
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
              _showBasketBottomSheet(context);
            },
            child: Padding(
              padding: AppPaddings.r12,
              child: BlocBuilder<BasketCubit, BasketState>(
                builder: (_, basketState) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(AppAssets.basketIcon, height: 30),
                      if (basketState.totalCount > 0)
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (_, state) {
              if (state is ProductsLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ProductsError) {
                log("products Error: ${state.message}");
                return Center(child: Text("Error"));
              }
              if (state is ProductsNetworkError) {
                log("product network error: ${state.message}");
                return Center(child: Text("network error"));
              }
              if (state is ProductsSuccess) {
                final data = state.response;

                return Padding(
                  padding: AppPaddings.a16,
                  child: GridView.builder(
                    itemCount: data.length,
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
                              child: Image.network(
                                data[index].productImage.toString(),
                              ),
                            ),
                            Padding(
                              padding: AppPaddings.h12,
                              child: Column(
                                children: [
                                  4.h,
                                  AppTitles(
                                    title: data[index].name.toString(),
                                    fSize: 16,
                                    fWeight: FontWeight.w600,
                                  ),
                                  6.h,
                                  AppTitles(
                                    title:
                                        data[index].shortDescription.toString(),
                                    fWeight: FontWeight.w500,
                                    color: AppColors.customGray,
                                  ),
                                  20.h,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppTitles(
                                        title: data[index].price.toString(),
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
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
