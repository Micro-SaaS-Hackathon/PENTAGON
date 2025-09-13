import 'package:flutter/material.dart';
import 'package:pizza_mizza_saas/presentation/screens/menu_screen/menu_screen.dart';
import 'package:pizza_mizza_saas/utils/constants/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}
