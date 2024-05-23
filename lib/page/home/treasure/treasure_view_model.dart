import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopping_app/gen/assets.gen.dart';
import 'package:shopping_app/gen/fonts.gen.dart';
import 'package:shopping_app/hook/hook_timber.dart';
import 'package:shopping_app/l10n/l10n.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/router/app_router.dart';
import 'package:shopping_app/style/widget_style.dart';
import 'package:shopping_app/utils/extension_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'treasure_page.dart';

final _productList = [
  Product(
    imageAsset: Assets.images.product.pd1.path,
    name: "Strawberry",
    title:"Fresh strawberries",
    description:"The garden strawberry (or simply strawberry; Fragaria × ananassa)[1] is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness.",
    price: 100,
  ),
  Product(
    imageAsset: Assets.images.product.pd2.path,
    name: "Coffee",
    title:"Strong coffee",
    description:"Coffee is a beverage brewed from roasted coffee beans. Darkly colored, bitter, and slightly acidic, coffee has a stimulating effect on humans, primarily due to its caffeine content. It has the highest sales in the world market for hot drinks.[2]",
    price: 100,
  ),
  Product(
    imageAsset: Assets.images.product.pd3.path,
    name: "Cake",
    title:"Multi-flavor cake",
    description:"Cake is a flour confection made from flour, sugar, and other ingredients and is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate and which share features with desserts such as pastries, meringues, custards, and pies.",
    price: 100,
  ),
  Product(
    imageAsset: Assets.images.product.pd4.path,
    name: "Crepe",
    title:"Fluffy and soft crepes",
    description:"A crêpe or crepe (/kreɪp/ ⓘ[3] or /krɛp/, French: [kʁɛp] ⓘ, Quebec French: [kʁaɪ̯p] ⓘ) is a dish made from unleavened batter or dough that is cooked on a frying pan or a griddle. Crêpes are usually one of two varieties: sweet crêpes (crêpes sucrées) or savoury galettes (crêpes salées). They are often served with a wide variety of fillings such as cheese, fruit, vegetables, meats, and a variety of spreads.[4] Crêpes can also be flambéed, such as in crêpes Suzette.",
    price: 100,
  ),
];
