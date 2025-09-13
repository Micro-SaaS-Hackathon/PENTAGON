import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final GetIt locator = GetIt.instance;
Future<void> init() async {
  await Hive.initFlutter();
}