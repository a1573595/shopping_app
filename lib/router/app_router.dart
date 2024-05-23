import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/page/guide/guide_page.dart';
import 'package:shopping_app/page/home/cart/cart_view_model.dart';
import 'package:shopping_app/page/home/home_page.dart';
import 'package:shopping_app/page/home/payment/payment_page.dart';
import 'package:shopping_app/page/home/product/product_page.dart';
import 'package:shopping_app/page/home/profile/profile_page.dart';
import 'package:shopping_app/page/home/search/search_view_model.dart';
import 'package:shopping_app/page/home/treasure/treasure_view_model.dart';
import 'package:shopping_app/page/login/about/about_page.dart';
import 'package:shopping_app/page/login/create_account/create_account_page.dart';
import 'package:shopping_app/page/login/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: GuideRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRouter.page,
          children: [
            AutoRoute(
              path: "",
              page: LoginRoute.page,
            ),
            AutoRoute(
              page: AboutRoute.page,
            ),
            AutoRoute(
              page: LicenseRoute.page,
            ),
            AutoRoute(
              page: CreateAccountRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: TreasureRoute.page,
            ),
            AutoRoute(
              page: SearchRoute.page,
            ),
            AutoRoute(
              page: PaymentRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: ProductRoute.page,
        ),
        AutoRoute(
          page: CartRoute.page,
        ),
      ];
}

@RoutePage(name: 'LoginRouter')
class _LoginRouter extends AutoRouter {
  const _LoginRouter({super.key});
}

@RoutePage(name: 'LicenseRoute')
class _LicensePage extends StatelessWidget {
  const _LicensePage({super.key});

  @override
  Widget build(BuildContext context) => const LicensePage();
}
