import 'package:flutter/material.dart';
import 'package:pizza_mizza_saas/presentation/widgets/app_titles.dart';
import 'package:pizza_mizza_saas/utils/constants/app_colors.dart';
import 'package:pizza_mizza_saas/utils/constants/app_paddings.dart';
import 'package:pizza_mizza_saas/utils/constants/app_radiuses.dart';
import 'package:pizza_mizza_saas/utils/extensions/screen_size_extension.dart';

class HomeGridItems extends StatelessWidget {
  const HomeGridItems({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadiuses.a12,
      ),
      child: Padding(
        padding: AppPaddings.a20,
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(icon, height: context.screenHeight * 0.09),
            Expanded(
              child: AppTitles(
                title: title,
                fWeight: FontWeight.w600,
                fSize: 20,
                height: 1,
              ),
            ),
            AppTitles(
              title: subtitle,
              fWeight: FontWeight.w500,
              fSize: 14,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}