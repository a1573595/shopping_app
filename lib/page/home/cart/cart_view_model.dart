import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/gen/assets.gen.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/style/widget_style.dart';
import 'package:shopping_app/widget/sheet.dart';

part 'cart_page.dart';

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  void addItem(int quantity) => CartItem(
        product: product,
        quantity: this.quantity + quantity,
      );
}

final _product1 = Product(
  imageAsset: Assets.images.product.pd1.path,
  name: "Strawberry",
  title: "Fresh strawberries",
  description:
      "The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.",
  price: 100,
);

final _product2 = Product(
  imageAsset: Assets.images.product.pd2.path,
  name: "Coffee",
  title: "Strong coffee",
  description:
      "Coffee is a beverage brewed from roasted coffee beans. Darkly colored, bitter, and slightly acidic, coffee has a stimulating effect on humans, primarily due to its caffeine content. It has the highest sales in the world market for hot drinks.[2]",
  price: 100,
);

final _product3 = Product(
  imageAsset: Assets.images.product.pd3.path,
  name: "Cake",
  title: "Multi-flavor cake",
  description:
      "Cake is a flour confection made from flour, sugar, and other ingredients and is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate and which share features with desserts such as pastries, meringues, custards, and pies.",
  price: 100,
);

final List<CartItem> _cartItemList = [
  CartItem(
    product: _product1,
    quantity: 2,
  ),
  CartItem(
    product: _product2,
    quantity: 3,
  ),
  CartItem(
    product: _product3,
    quantity: 1,
  ),
];
