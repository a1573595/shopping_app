part of 'cart_view_model.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.current.cart),
      ),
      body: const _ListBody(),
    );
  }
}

class _ListBody extends StatelessWidget {
  const _ListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: WidgetStyle.screenPadding,
            physics: const BouncingScrollPhysics(),
            itemCount: _cartItemList.length,
            itemBuilder: (context, index) => _CartCell(
              cartItem: _cartItemList[index],
            ),
          ),
        ),
        Sheet(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                L10n.current.orderTotal,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.teko,
                    ),
              ),
              Text(
                "\$ 100",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: FontFamily.questrial,
                    ),
              ),
              const SizedBox(
                height: 32,
              ),
              const _CheckButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class _CartCell extends StatelessWidget {
  const _CartCell({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Card(
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              cartItem.product.imageAsset,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            cartItem.product.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.teko,
                ),
          ),
          subtitle: Text(
            "\$ ${cartItem.product.price}",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.teko,
                ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove),
              ),
              Text(
                "${cartItem.quantity}",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: FontFamily.openSans,
                    ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckButton extends StatelessWidget {
  const _CheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          L10n.current.checkout,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}

class _EmptyBody extends StatelessWidget {
  const _EmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: MediaQuery.sizeOf(context).width / 6,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            L10n.current.nothing,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.questrial,
                ),
          ),
        ],
      ),
    );
  }
}
