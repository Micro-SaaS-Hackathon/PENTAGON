import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pizza_mizza_qr_code_scanner/cubits/cubit/take_order_cubit.dart';
import 'package:pizza_mizza_qr_code_scanner/data/contractor/take_order_contractor.dart';
import 'package:pizza_mizza_qr_code_scanner/data/repository/take_order_repository.dart';
import 'package:pizza_mizza_qr_code_scanner/data/services/take_order_service.dart';

final GetIt locator = GetIt.instance;
Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  final Box<String> box = await Hive.openBox('loginBox');

  // Service

  locator.registerLazySingleton(() => TakeOrderService());

  // Contractor

  locator.registerLazySingleton<TakeOrderContractor>(
    () => TakeOrderRepository(locator<TakeOrderService>()),
  );

  // Cubit

  locator.registerFactory(() => TakeOrderCubit(locator()));
}
