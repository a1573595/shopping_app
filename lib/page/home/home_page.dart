import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/widget/twice_pop_scope.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = useMemoized(() => [
          BottomNavigationBarItem(
            icon: const Icon(Icons.storefront),
            label: L10n.current.treasure,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: L10n.current.search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.payment),
            label: L10n.current.payment,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: L10n.current.profile,
          ),
        ]);

    return TwicePopScope(
      child: AutoTabsRouter(
        builder: (context, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              currentIndex: context.tabsRouter.activeIndex,
              onTap: context.tabsRouter.setActiveIndex,
              items: items,
            ),
          );
        },
      ),
    );
  }
}
