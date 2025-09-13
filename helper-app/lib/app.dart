import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mizza_qr_code_scanner/cubits/cubit/take_order_cubit.dart';
import 'package:pizza_mizza_qr_code_scanner/presentation/screens/qr_scanner_screen.dart';
import 'package:pizza_mizza_qr_code_scanner/utils/locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => locator<TakeOrderCubit>(),
        child: QRScannerScreen(),
      ),
    );
  }
}
