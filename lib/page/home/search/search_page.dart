part of 'search_view_model.dart';

@RoutePage()
class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();

    final isUpVisible = useState(false);

    useEffect(() {
      controller.addListener(() {
        isUpVisible.value = controller.offset > 100;
      });

      return;
    }, const []);

    return SafeArea(
      child: Padding(
        padding: WidgetStyle.screenVerticalPadding.copyWith(
          bottom: 0,
        ),
        child: Stack(
          children: [
            GridView.builder(
              controller: controller,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                top: kToolbarHeight,
                left: 8,
                right: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 12 / 9,
              ),
              itemCount: _catalogList.length,
              itemBuilder: (context, index) => _CatalogItem(_catalogList[index]),
            ),
            Padding(
              padding: WidgetStyle.screenHorizontalPadding,
              child: InkWell(
                onTap: () => showSearch(
                  context: context,
                  delegate: _SearchBarDelegate(),
                ),
                child: IgnorePointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: L10n.current.search,
                      hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontFamily: FontFamily.questrial,
                          ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: WidgetStyle.textFieldRadius,
                      ),
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    // enabled: false,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Visibility(
                visible: isUpVisible.value,
                child: FloatingActionButton(
                  onPressed: () => controller.jumpTo(0),
                  child: const Icon(Icons.arrow_upward_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBarDelegate extends SearchDelegate<Catalog> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _catalogList.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].title),
          onTap: () => close(context, results[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _catalogList.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results[index].title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.questrial,
                ),
          ),
          onTap: () => query = results[index].title,
        );
      },
    );
  }
}

class _CatalogItem extends StatelessWidget {
  const _CatalogItem(this.catalog, {super.key});

  final Catalog catalog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            Image.asset(
              catalog.imageAsset,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              color: Colors.black45,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                catalog.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      fontFamily: FontFamily.questrial,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
