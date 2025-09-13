import 'package:flutter/material.dart';
import 'package:pizza_mizza_qr_code_scanner/app.dart';
import 'package:pizza_mizza_qr_code_scanner/utils/locator.dart';

void main() async{
  await init();
  await setupLocator();
  runApp(const MyApp());
}


