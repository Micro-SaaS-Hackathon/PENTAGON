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

  void _showBasketBottomSheet(BuildContext context) {
    final basketCubit = BlocProvider.of<BasketCubit>(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext sheetContext) {
        return BlocProvider.value(
          value: basketCubit,
          child: Container(
            width: sheetContext.screenWidth,
            height: 0.7 * sheetContext.screenHeight,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: AppPaddings.a14,
              child: BlocBuilder<BasketCubit, BasketState>(
                builder: (context, basketState) {
                  // Get the products from the updated state model
                  final products = basketState.productsWithCount.keys.toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTitles(
                        title: "Your Basket",
                        fWeight: FontWeight.bold,
                        fSize: 20,
                      ),
                      10.h,
                      if (products.isEmpty)
                        Center(
                          child: AppTitles(
                            title: "No product is added to basket",
                            fWeight: FontWeight.w600,
                            color: AppColors.customRed,
                            fSize: 20,
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              final count =
                                  basketState.productsWithCount[product];

                              return ListTile(
                                leading: Image.network(
                                  product.productImage.toString(),
                                ),
                                title: AppTitles(
                                  title: product.name.toString(),
                                  fSize: 16,
                                  fWeight: FontWeight.w500,
                                ),
                                subtitle: Text(
                                  "Count: $count",
                                ), // Display the count
                                trailing: AppTitles(
                                  title:
                                      "\$${(product.price! * count!).toStringAsFixed(2)}",
                                  fWeight: FontWeight.w500,
                                  fSize: 16,
                                ),
                              );
                            },
                          ),
                        ),
                      // Display the total price at the bottom
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTitles(
                            title: "Total:",
                            fWeight: FontWeight.bold,
                            fSize: 18,
                          ),
                          AppTitles(
                            title:
                                "\$${basketState.totalPrice.toStringAsFixed(2)}",
                            fWeight: FontWeight.bold,
                            fSize: 18,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomElevatedButton(
                            text: "Submit Order",
                            onPressed: () {
                              _showOrderConfirmationDialog(sheetContext);
                            },
                            borderRadius: AppRadiuses.a12,
                            backgroundColor: AppColors.customRed,
                            textColor: AppColors.white,
                            fSize: 16,
                          ),
                        ],
                      ),
                    ],
                  );
                },
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
                      if (basketState.totalItemCount > 0)
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
                                basketState.totalItemCount.toString(),
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
                      final product = data[index];
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
                                        title:
                                            "\$${data[index].price.toString()}",
                                        fWeight: FontWeight.w600,
                                        fSize: 16,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<BasketCubit>(
                                            context,
                                          ).addProductToBasket(product);
                                          log(
                                            "Product added to basket: ${product.name}",
                                          );
                                        },
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
