import 'package:flutter/material.dart';
import 'package:pizza_mizza_saas/app.dart';
import 'package:pizza_mizza_saas/utils/di/locator.dart';

void main() async {
  await init();
  await setupLocator();
  runApp(const MyApp());
}
