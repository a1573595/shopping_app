part of 'treasure_view_model.dart';

@RoutePage()
class TreasurePage extends StatelessWidget {
  const TreasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.current.treasure),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const CartRoute()),
            icon: const Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(Icons.shopping_cart_outlined),
                Badge(),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: WidgetStyle.screenVerticalPadding.copyWith(
          top: 0,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const _AdPageView();
          } else if (index == 1) {
            return const _FeatureView();
          } else {
            return const _TopicView();
          }
        },
      ),
    );
  }
}

class _AdPageView extends HookWidget {
  const _AdPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = useMemoized(() => MediaQuery.sizeOf(context).radius);

    final adList = useMemoized(() => [
          Assets.images.ad.ad1.path,
          Assets.images.ad.ad2.path,
          Assets.images.ad.ad3.path,
          Assets.images.ad.ad4.path,
          Assets.images.ad.ad5.path,
        ]);

    final controller = usePageController();

    final timer = useTimberPeriodic(() {
      final currentPage = (controller.page ?? 0).toInt();

      controller.animateToPage(
        currentPage < adList.length - 1 ? (currentPage + 1) : 0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }, const Duration(seconds: 5), const []);

    return SizedBox(
      height: radius * 0.35,
      child: Stack(
        children: [
          Listener(
            onPointerDown: (event) => timer.cancel(),
            onPointerUp: (event) => timer.reset(),
            child: PageView.builder(
              controller: controller,
              itemCount: adList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  adList[index],
                  fit: BoxFit.cover,
                );
              },
              onPageChanged: (value) => timer.reset(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: controller, // PageController
                count: adList.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 24,
                  dotColor: Colors.white,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ), // your preferred effect
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureView extends HookWidget {
  const _FeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = useMemoized(() => MediaQuery.sizeOf(context).radius);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            L10n.current.feature,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.questrial,
                ),
          ),
        ),
        SizedBox(
          height: radius * 0.4,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _productList.length,
            itemBuilder: (BuildContext context, int index) => _FeatureItem(_productList[index]),
          ),
        ),
      ],
    );
  }
}

class _TopicView extends HookWidget {
  const _TopicView({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = useMemoized(() => MediaQuery.sizeOf(context).radius);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            L10n.current.topic,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.questrial,
                ),
          ),
        ),
        SizedBox(
          height: radius * 0.4,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _productList.length,
            itemBuilder: (BuildContext context, int index) => _TopicItem(_productList[index]),
          ),
        ),
        Padding(
          padding: WidgetStyle.screenHorizontalPadding,
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                L10n.current.more,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: FontFamily.questrial,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () => context.router.push(ProductRoute(product: product)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    product.imageAsset,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: FontFamily.teko,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: FontFamily.questrial,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TopicItem extends StatelessWidget {
  const _TopicItem(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(ProductRoute(product: product)),
      customBorder: const RoundedRectangleBorder(
        borderRadius: WidgetStyle.textFieldRadius,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    product.imageAsset,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: FontFamily.teko,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: FontFamily.questrial,
                      ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 32,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: const Icon(
                  Icons.favorite_border,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
