import 'package:equatable/equatable.dart';

class Catalog with EquatableMixin {
  const Catalog({
    required this.imageAsset,
    required this.title,
  });

  final String imageAsset;
  final String title;

  @override
  List<Object?> get props => [
        imageAsset,
        title,
      ];
}
