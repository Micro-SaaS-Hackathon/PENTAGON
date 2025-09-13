import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pizza_mizza_saas/cubits/products/products_cubit.dart';
import 'package:pizza_mizza_saas/data/contractors/products_contractor.dart';
import 'package:pizza_mizza_saas/data/repositories/products_repository.dart';
import 'package:pizza_mizza_saas/data/services/remote/products_service.dart';

final GetIt locator = GetIt.instance;
Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  // service
  locator.registerLazySingleton(() => ProductsService());

  // contractor
  locator.registerLazySingleton<ProductsContractor>(
    () => ProductsRepository(locator<ProductsService>()),
  );

  // cubit
  locator.registerFactory(() => ProductsCubit(locator()));
}
