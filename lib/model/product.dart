import 'package:equatable/equatable.dart';

class Product with EquatableMixin {
  const Product({
    required this.imageAsset,
    required this.name,
    required this.title,
    required this.description,
    required this.price,
  });

  final String imageAsset;
  final String name;
  final String title;
  final String description;
  final int price;

  @override
  List<Object?> get props => [
        imageAsset,
        name,
        title,
        description,
        price,
      ];
}
