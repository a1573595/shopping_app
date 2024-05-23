import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/gen/assets.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/router/app_router.dart';
import 'package:shopping_app/style/widget_style.dart';
import 'package:shopping_app/utils/extension_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Guide {
  const Guide({
    required this.imageAssets,
    required this.title,
  });

  final String imageAssets;
  final String title;
}

@RoutePage()
class GuidePage extends HookWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final headerController = usePageController()..onAttach;
    final footerController = usePageController();

    final isLast = useState(false);

    final guideList = useMemoized(() => [
          Guide(
            imageAssets: Assets.images.guide.puzzle.path,
            title: L10n.current.diverse,
          ),
          Guide(
            imageAssets: Assets.images.guide.fast.path,
            title: L10n.current.fast,
          ),
          Guide(
            imageAssets: Assets.images.guide.saving.path,
            title: L10n.current.cheap,
          ),
        ]);

    final onSkip = useCallback(() => context.router.replace(const LoginRoute()));

    final onNextClick = useCallback(() {
      headerController.page?.let((it) {
        if (it + 1 < guideList.length) {
          headerController.animateToPage(
            it.toInt() + 1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          );
        } else {
          onSkip.call();
        }
      });
    });

    useEffect(() {
      headerController.addListener(() {
        final page = headerController.offset ~/ size.width;
        final pagePosition = page * size.width;

        final transformedValue = Curves.easeOutSine.transform((headerController.offset - pagePosition) / size.width);
        final offset = transformedValue * size.width;

        footerController.jumpTo(pagePosition + offset);
      });

      return;
    }, const []);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: footerController,
              reverse: true,
              pageSnapping: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: guideList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  const Spacer(),
                  const Spacer(),
                  Text(
                    guideList[index].title,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const Spacer(),
                ],
              ),
              onPageChanged: (position) => isLast.value = position == guideList.length - 1,
            ),
            PageView.builder(
              controller: headerController,
              physics: const ClampingScrollPhysics(),
              itemCount: guideList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    guideList[index].imageAssets,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            ),
            Visibility(
              visible: !isLast.value,
              child: Positioned(
                top: 0,
                right: 0,
                child: TextButton(
                  onPressed: onSkip,
                  child: Text(
                    L10n.current.skip,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 42,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: headerController,
                  count: guideList.length,
                  effect: CustomizableEffect(
                    spacing: 12,
                    dotDecoration: DotDecoration(
                      borderRadius: WidgetStyle.circleRadius,
                      color: Theme.of(context).disabledColor,
                      height: 8,
                      width: 8,
                    ),
                    activeDotDecoration: DotDecoration(
                      borderRadius: WidgetStyle.circleRadius,
                      color: Theme.of(context).colorScheme.primary,
                      height: 8,
                      width: 24,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 16,
              right: 16,
              child: Align(
                alignment: Alignment.bottomRight,
                child: AnimatedContainer(
                  height: 48,
                  width: isLast.value ? size.width - 32 : 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: isLast.value ? WidgetStyle.circleRadius : BorderRadius.circular(12),
                  ),
                  duration: const Duration(milliseconds: 100),
                  child: InkWell(
                    onTap: onNextClick,
                    child: SizedBox(
                      width: double.infinity,
                      child: isLast.value
                          ? Text(
                              L10n.current.start,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                            )
                          : const Icon(
                              Icons.arrow_forward,
                              size: 24,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
