import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/router/app_router.dart';
import 'package:shopping_app/style/widget_style.dart';
import 'package:shopping_app/widget/animated_parabola_widget.dart';
import 'package:shopping_app/widget/animated_shake_widget.dart';

@RoutePage()
class ProductPage extends HookWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final animatedParabolaKey = useMemoized(GlobalKey<AnimatedParabolaWidgetState>.new);

    final iconKey = useMemoized(GlobalKey<AnimatedShakeWidgetState>.new);
    final floatKey = useMemoized(GlobalKey.new);

    return AnimatedParabolaWidget(
      key: animatedParabolaKey,
      duration: const Duration(milliseconds: 350),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                  child: Image.asset(
                    product.imageAsset,
                    fit: BoxFit.cover,
                    height: (MediaQuery.sizeOf(context).height * .6).roundToDouble(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: WidgetStyle.screenPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontFamily: FontFamily.questrial,
                              ),
                        ),
                        Text(
                          "\$ ${product.price}",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontFamily: FontFamily.teko,
                              ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: WidgetStyle.screenVerticalPadding,
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              product.description,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: FontFamily.openSans,
                                  ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await animatedParabolaKey.currentState!.startAnimated(floatKey, iconKey);
                            await iconKey.currentState!.shake();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                key: floatKey,
                                child: Icon(
                                  Icons.attach_money,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                L10n.current.addToCart,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: kToolbarHeight,
              left: 4,
              right: 4,
              child: Row(
                children: [
                  const BackButton(
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Text(
                      product.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                            fontFamily: FontFamily.teko,
                          ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.router.push(const CartRoute()),
                    icon: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(
                          key: iconKey,
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        const Badge(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
