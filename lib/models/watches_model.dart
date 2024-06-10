import 'package:scentwrist/utils/app_assets.dart';

class WatchModel {
  final String name;
  final String price;
  final String image;

  WatchModel({required this.name, required this.price, required this.image});
}

List<WatchModel> watches = [
  WatchModel(name: 'True Square', price: "4,518", image: AppImages.w1),
  WatchModel(name: 'True Round', price: "6,260", image: AppImages.w2),
  WatchModel(name: 'Captain Cook', price: "4,470", image: AppImages.w3),
  WatchModel(name: 'Emporio Armani', price: "2,200", image: AppImages.w4),
  WatchModel(name: 'True Round', price: "1,850", image: AppImages.w5),
  WatchModel(name: 'Michael Kors', price: "3,150", image: AppImages.w6),
];
