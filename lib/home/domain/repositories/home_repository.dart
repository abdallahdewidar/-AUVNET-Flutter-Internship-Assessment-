import 'package:auvshop/home/domain/entities/restaurant.dart';

abstract class HomeRepository {
  Future<List<Restaurant>> getNearbyRestaurants();
}
