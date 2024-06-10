import 'package:scentwrist/utils/app_assets.dart';

class PerfumeModel {
  final String name;
  final String price;
  final String image;

  PerfumeModel({required this.name, required this.price, required this.image});
}

List<PerfumeModel> perfumes = [
  PerfumeModel(name: 'VALENTINO WOODS', price: "450", image: AppImages.p1),
  PerfumeModel(name: 'NEST GLORY', price: "660", image: AppImages.p2),
  PerfumeModel(name: 'KAYALI OBSIDIAN', price: "470", image: AppImages.p3),
  PerfumeModel(name: 'FRESH TIDES', price: "220", image: AppImages.p4),
  PerfumeModel(name: 'REX Perfume', price: "250", image: AppImages.p5),
  PerfumeModel(name: 'GREEN SAIL', price: "150", image: AppImages.p6),
];
