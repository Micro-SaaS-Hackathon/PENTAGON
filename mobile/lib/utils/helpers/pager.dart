import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mizza_saas/presentation/screens/menu_screen/menu_screen.dart';

class Pager {
  Pager._();

  static Widget get menu =>
      BlocProvider(create: (context) => , child: MenuScreen());
}
