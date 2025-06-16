import 'package:auvshop/home/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant {
  RestaurantModel({
    required super.name,
    required super.rating,
    required super.imageUrl,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['name'],
      rating: double.parse(json['rating'].toString()),
      imageUrl: json['image_url'],
    );
  }
}
