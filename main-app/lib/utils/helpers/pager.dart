import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mizza_saas/cubits/basket/basket_cubit.dart';
import 'package:pizza_mizza_saas/cubits/products/products_cubit.dart';

import 'package:pizza_mizza_saas/presentation/screens/menu_screen/menu_screen.dart';
import 'package:pizza_mizza_saas/utils/di/locator.dart';

class Pager {
  Pager._();


  static Widget get menu => MultiBlocProvider(
    providers: [
      BlocProvider<ProductsCubit>(
        create: (_) => locator<ProductsCubit>()..getProducts(),
      ),
      BlocProvider(create: (context) => BasketCubit()),
    ],
    child: MenuScreen(),
  );
}
